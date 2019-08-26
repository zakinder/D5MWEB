--05022019 [05-02-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity CameraRawToRgb is
generic (
    img_width           : integer := 8;
    dataWidth           : integer := 12;
    addrWidth           : integer := 12);
port (
    m_axis_mm2s_aclk    : in std_logic;
    m_axis_mm2s_aresetn : in std_logic;
    pixclk              : in std_logic;
    ifval               : in std_logic;
    ilval               : in std_logic;
    idata               : in std_logic_vector(dataWidth-1 downto 0);
    oRgbSet             : out rRgb);
end CameraRawToRgb;
architecture arch_imp of CameraRawToRgb is
    signal rawTp            : rTp;
    signal rawData          : rData;
begin
CameraRawDataInst: CameraRawData
generic map(
    img_width            => img_width)
port map(
    m_axis_aclk          => m_axis_mm2s_aclk,
    m_axis_aresetn       => m_axis_mm2s_aresetn,
    pixclk               => pixclk,
    ifval                => ifval,
    ilval                => ilval,
    idata                => idata,
    oRawData             => rawData);
dataTapsInst: dataTaps
generic map(
    img_width            => img_width,
    dataWidth            => dataWidth,
    addrWidth            => addrWidth)
port map(
    aclk                 => m_axis_mm2s_aclk,
    iRawData             => rawData,
    oTpData              => rawTp);
RawToRgbInst: RawToRgb
port map(
    clk                  => m_axis_mm2s_aclk,
    rst_l                => m_axis_mm2s_aresetn,
    iTpData              => rawTp,
    oRgbSet              => oRgbSet);
end arch_imp;