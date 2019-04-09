--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity videoProcess_v1_0_rgb_m_axis is 
    generic (
    i_data_width           : integer := 8;
    s_data_width           : integer := 16);
    port (
    --stream clock/reset
    m_axis_mm2s_aclk     : in std_logic;
    m_axis_mm2s_aresetn  : in std_logic;
    --config
    aBusSelect           : in std_logic_vector(31 downto 0);
    --ycbcr
    color_valid          : in std_logic;
    mpeg444Y             : in std_logic_vector(i_data_width-1 downto 0);
    mpeg444CB            : in std_logic_vector(i_data_width-1 downto 0);
    mpeg444CR            : in std_logic_vector(i_data_width-1 downto 0);
    --image resolution
    iEof                 : in std_logic;
    iSof                 : in std_logic;
    pXcont               : in std_logic_vector(15 downto 0);
    pYcont               : in std_logic_vector(15 downto 0);
    --stream to master out
    rx_axis_tready_o     : in std_logic;
    rx_axis_tvalid       : out std_logic;
    rx_axis_tuser        : out std_logic;
    rx_axis_tlast        : out std_logic;
    rx_axis_tdata        : out std_logic_vector(s_data_width-1 downto 0);
    --tx channel
    rgb_m_axis_tvalid    : out std_logic;
    rgb_m_axis_tlast     : out std_logic;
    rgb_m_axis_tuser     : out std_logic;
    rgb_m_axis_tready    : in std_logic;
    rgb_m_axis_tdata     : out std_logic_vector(s_data_width-1 downto 0);
    --rx channel
    rgb_s_axis_tready    : out std_logic;
    rgb_s_axis_tvalid    : in std_logic;
    rgb_s_axis_tuser     : in std_logic;
    rgb_s_axis_tlast     : in std_logic;
    rgb_s_axis_tdata     : in std_logic_vector(s_data_width-1 downto 0));
end videoProcess_v1_0_rgb_m_axis;
architecture arch_imp of videoProcess_v1_0_rgb_m_axis is
    signal configReg4R       : std_logic_vector(31 downto 0):= (others => lo);
    signal axis_sof          : std_logic;
    signal mpeg42XCR         : std_logic_vector(i_data_width-1 downto 0);
    signal mpeg42XBR         : std_logic :=lo;
    signal mpeg42XXX         : std_logic :=lo;
    signal tx_axis_tvalid    : std_logic;
    signal tx_axis_tlast     : std_logic;
    signal tx_axis_tuser     : std_logic;
    signal tx_axis_tready    : std_logic;
	signal pEofs1            : std_logic :=lo;
    signal tx_axis_tdata     : std_logic_vector(s_data_width-1 downto 0);
    type video_io_state is (VIDEO_SET_RESET,VIDEO_SOF_OFF,VIDEO_SOF_ON,VIDEO_END_OF_LINE);
    signal VIDEO_STATES      : video_io_state; 
begin
process (m_axis_mm2s_aclk) begin
    if rising_edge(m_axis_mm2s_aclk) then
            mpeg42XBR  <= not(mpeg42XBR) and color_valid;
            mpeg42XXX  <= not(mpeg42XBR);
    end if;
end process;
process (m_axis_mm2s_aclk) begin
    if rising_edge(m_axis_mm2s_aclk) then
            mpeg42XCR   <= mpeg444CR;
            configReg4R <= aBusSelect;
    end if;
end process;
process (m_axis_mm2s_aclk) begin
    if (rising_edge (m_axis_mm2s_aclk)) then
        if (m_axis_mm2s_aresetn = lo) then
            VIDEO_STATES <= VIDEO_SET_RESET;
        else
        tx_axis_tuser <=axis_sof;
        case (VIDEO_STATES) is
        when VIDEO_SET_RESET =>
            tx_axis_tlast  <= lo;
            tx_axis_tvalid <= lo;
            tx_axis_tdata  <= (others => lo);    
            axis_sof       <= lo;
        if (iSof = '1') then
            VIDEO_STATES <= VIDEO_SOF_OFF;
        else
            VIDEO_STATES <= VIDEO_SET_RESET;
        end if;
        when VIDEO_SOF_OFF =>
        if (color_valid = hi) then
            VIDEO_STATES <= VIDEO_SOF_ON;
            axis_sof     <= hi;
        else
            VIDEO_STATES <= VIDEO_SOF_OFF;
        end if;
        when VIDEO_SOF_ON =>
            axis_sof       <= lo;
			tx_axis_tvalid <= hi;
            if(iEof = hi) then
                pEofs1 <= hi;
            end if;
            if (configReg4R = EXTERNAL_AXIS_STREAM)then
                if(mpeg42XXX =hi)then
                    tx_axis_tdata  <= (mpeg444CB & mpeg444Y);
                else
                    tx_axis_tdata  <= (mpeg42XCR & mpeg444Y);
                end if;
            elsif (configReg4R = STREAM_TESTPATTERN1)then
                tx_axis_tdata  <= pXcont;
            elsif (configReg4R = STREAM_TESTPATTERN2)then
                tx_axis_tdata  <= pYcont;
            else
                if(mpeg42XXX =hi)then
                    tx_axis_tdata  <= (mpeg444CB & mpeg444Y);
                else
                    tx_axis_tdata  <= (mpeg42XCR & mpeg444Y);
                end if;
            end if;
        if (color_valid = hi) then
            tx_axis_tlast  <= lo;
            VIDEO_STATES <= VIDEO_SOF_ON;
        else
            tx_axis_tlast  <= hi;
            VIDEO_STATES <= VIDEO_END_OF_LINE;
        end if;
        when VIDEO_END_OF_LINE =>
            tx_axis_tlast  <= lo;
            tx_axis_tvalid <= lo;
            if (pEofs1 = hi) then
                VIDEO_STATES <= VIDEO_SOF_OFF;
				pEofs1 <= lo;
            elsif (color_valid = hi) then
                VIDEO_STATES <= VIDEO_SOF_ON;
            else
                VIDEO_STATES <= VIDEO_END_OF_LINE;
            end if;
        when others =>
            VIDEO_STATES <= VIDEO_SET_RESET;
        end case;
        end if;
    end if;
end process;
process (m_axis_mm2s_aclk) begin
    if rising_edge(m_axis_mm2s_aclk) then 
        if m_axis_mm2s_aresetn = lo then
                rx_axis_tvalid     <= lo;
                rx_axis_tuser      <= lo;
                rx_axis_tlast      <= lo;
                rx_axis_tdata      <= (others => lo);
                rgb_m_axis_tvalid  <= lo;
                rgb_m_axis_tuser   <= lo;
                rgb_m_axis_tlast   <= lo;
                rgb_m_axis_tdata   <= (others => lo);
                tx_axis_tready     <= lo;
        else
            if (configReg4R = EXTERNAL_AXIS_STREAM)then
                --external processed(unused) parallel copy of cpuTX delayed
                rgb_s_axis_tready  <= rx_axis_tready_o;
                rx_axis_tvalid     <= rgb_s_axis_tvalid;
                rx_axis_tuser      <= rgb_s_axis_tuser;
                rx_axis_tlast      <= rgb_s_axis_tlast;
                rx_axis_tdata      <= rgb_s_axis_tdata;
            else
                -- to cpuTX
                rx_axis_tvalid     <= tx_axis_tvalid;
                rx_axis_tuser      <= tx_axis_tuser;
                rx_axis_tlast      <= tx_axis_tlast;
                rx_axis_tdata      <= tx_axis_tdata;
            end if;
                --parallel internal copy of cpuTX
                tx_axis_tready     <= rgb_m_axis_tready;
                rgb_m_axis_tvalid  <= tx_axis_tvalid;
                rgb_m_axis_tuser   <= tx_axis_tuser;
                rgb_m_axis_tlast   <= tx_axis_tlast;
                rgb_m_axis_tdata   <= tx_axis_tdata;
        end if;
    end if;
end process;
end arch_imp;