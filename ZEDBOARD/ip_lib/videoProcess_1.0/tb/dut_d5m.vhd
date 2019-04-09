--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.commonpackage.all;
entity dut_d5m is
generic (
    pixclk_freq                 : real    := 90.00e6;
    img_width                   : integer := 112;
    line_hight                  : integer := 122;
    p_data_width                : integer := 11);
port (
    pixclk                      : out std_logic;
    ifval                       : out std_logic;
    ilval                       : out std_logic;
    idata                       : out std_logic_vector(p_data_width downto 0));
end dut_d5m;
architecture arch_imp of dut_d5m is
    -------------------------------------------------------------------------
    type camlink_buffer_bus is record
        frame_high        : integer range 0 to line_hight;
        valid_high        : integer range 0 to line_hight;
        d5mdata           : integer range 0 to line_hight;
        fvalid            : std_logic;
        lvalid            : std_logic;
        data              : std_logic_vector(p_data_width downto 0);
        horizontal_blank  : std_logic;
        vertical_blank    : std_logic;
        valid_image_data  : std_logic;
    end record;
    signal video          : camlink_buffer_bus;
    signal d5mclk         : std_logic;
    signal aresetn        : std_logic;
    begin
    clk_gen(d5mclk, pixclk_freq);
    pixclk <= d5mclk;
    ifval  <= video.fvalid;
    ilval  <= video.lvalid;
    idata  <= video.data;
    process begin
        aresetn  <= '0';
    wait for 100 ns;
        aresetn  <= '1';
    wait;
    end process;
    process (d5mclk,aresetn) begin
        if (aresetn ='0') then 
            video.frame_high <= 0;
        elsif (rising_edge(d5mclk) ) then
            if (video.valid_high = img_width + 40) then
                if (video.frame_high > line_hight) then
                    video.frame_high <= 0;
                else
                    video.frame_high <= video.frame_high + 1;
                end if;
            end if;
        end if;
    end process;
    process (d5mclk,aresetn) begin
        if (aresetn ='0') then
            video.valid_high <= 0;
        elsif(rising_edge(d5mclk) ) then
            if (video.valid_high > img_width + 40) then
                video.valid_high <= 1;
            else
                video.valid_high <= video.valid_high + 1;
            end if;
        end if;
    end process;
    -------------------------------------------------------------------------------------------
        video.fvalid  <='1' when (video.frame_high < line_hight and aresetn ='1') else '0';
        video.lvalid  <='1' when (video.valid_high < img_width and video.fvalid ='1') else '0';
    -------------------------------------------------------------------------------------------
        process(video.fvalid,video.lvalid,video.d5mdata) begin
            if (video.fvalid ='1' and video.lvalid ='1') then
                video.data         <= std_logic_vector(to_unsigned(video.d5mdata, 12));
            else
                video.data         <=(others => '0');
            end if;
        end process;
    -------------------------------------------------------------------------------------------
    process (d5mclk,aresetn) begin
        if (aresetn ='0') then
            video.horizontal_blank <= '0';
            video.vertical_blank   <= '0';
            video.valid_image_data <= '0';
            video.d5mdata          <= 0;
        elsif(rising_edge(d5mclk) ) then
            if (video.fvalid ='1' and video.lvalid ='1') then
                video.valid_image_data <= '1';
                video.d5mdata <= video.d5mdata + 100;
            else
                video.valid_image_data <= '0';
                video.d5mdata          <= 0;
            end if;
            if (video.fvalid ='1' and video.lvalid ='0') then
                video.horizontal_blank <= '1';
            else
                video.horizontal_blank <= '0';
            end if;
            if (video.fvalid ='0' and video.lvalid ='0') then
                video.vertical_blank <= '1';
            else
                video.vertical_blank <= '0';
            end if;
        end if;
    end process; 
    -------------------------------------------------------------------------------------------
end arch_imp;