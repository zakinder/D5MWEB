#include <xbasic_types.h>
#include "../SYSTEM_CONFIG_HEADER/system_config_header.h"
#define id_set_hdmi 0x4B48633B
#define id_set_camera 0x683EB001
#define id_set_uart 0x4B489514
#define id_set_camerasize 0x10BD1675
#define id_set_mipicamera 0x656D6163
#define id_write_mipicamerareg 0x4FD29D30
#define id_read_hdmiiic 0x63696969
#define id_read_cameraiic 0x204A3169
#define id_read_hdmireg 0x67657269
#define id_read_camerareg 0x204A34C9
#define id_read_vdma1test 0x65740161
#define id_read_vdma2test 0x65740261
#define mipi_reset_n 0
#define mipi_cs_n 4
#define camera_pwdn_n 8

int camera_exposer(u16 exposer_value);
void pRexposer();
void d5mtestpattern(u16 pattern_num);
void d5mcolorgain();
u16 img(u16 read_address);
void camerawrite(u16 value);
void master_menu();
void cmd_menu();
void cameramenu();
void camera_set_registers();
int img_write_register(u8 address, u16 value);
int img_by_write_register(u8 address, u32 value);
void d5m_registers_2xwrite(u8 address, u32 value);
void d5m_registers_write(u8 address, u16 value);
int img_read_register(u8 address, u16 *value);
void d5m_config1();
void cfa_config1();
void d5m_config2();
void d5m_config3();
void d5m_configV();
void camera_hdmi_config();
void camera_vga_config();
u16 d5mregread(u8 address) ;
void mipicamerawritereg(u16 reg,u16 value);
void mipiread();
void mipicameraread();
u32 read_in(u8 offset);
void write_in(u8 offset,u32 data);
typedef struct  d5m_areg
{
 u8 chipversion_adr;
 u8 row_start_adr;
 u8 column_star_adr;
 u8 row_size_adr;
 u8 column_size_adr;
 u8 horizontal_blank_adr;
 u8 vertical_blank_adr;
 u8 output_control_adr;
 u8 shutter_width_upper_adr;
 u8 shutter_width_lower_adr;
 u8 pixel_clock_control_adr;
 u8 restart_adr;
 u8 shutter_delay_adr;
 u8 reset_adr;
 u8 pll_control_adr;
 u8 pll_config_1_adr;
 u8 pll_config_2_adr;
}d5m_rregaddress;
typedef struct  d5m_reg
{
     int chipversion;
     int row_start;
     int column_star;
     int row_size;
     int column_size;
     int horizontal_blank;
     int vertical_blank;
     int output_control;
     int shutter_width_upper;
     int shutter_width_lower;
     int pixel_clock_control;
     int restart;
     int shutter_delay;
     int reset;
     int pll_control;
     int pll_config_1;
     int pll_config_2;
     int read_mode_1;
     int read_mode_2;
     int row_address_mode;
     int column_address_mode;
     int green1_gain;
     int blue_gain;
     int red_gain;
     int green2_gain;
     int global_gain;
     int row_black_target;
     int row_black_default_offset;
     int blc_sample_size;
     int blc_tune_1;
     int blc_delta_thresholds;
     int blc_tune_2;
     int blc_target_thresholds;
     int green1_offset;
     int green2_offset;
     int black_level_calibration;
     int red_offset;
     int blue_offset;
     int test_pattern_control;
     int test_pattern_green;
     int test_pattern_red;
     int test_pattern_blue;
     int test_pattern_bar_width;
}d5m_rreg;
void cameraread(d5m_rreg *d5m_rreg_ptr);
void D5mReg(d5m_rreg *d5m_rreg_ptr);
void camerarUpdate();
void read_exposer_register();
void cameraexposerread(d5m_rreg *d5m_rreg_ptr);
