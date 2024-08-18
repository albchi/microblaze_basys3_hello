library ieee;
use ieee.std_logic_1164.all;

entity tb_toplevel is
end tb_toplevel;

architecture tb of tb_toplevel is

  component lab3_top is -- the FPGA  
    port (     
            reset_pb : in STD_LOGIC;
            sysclk : in STD_LOGIC;
            led : out STD_LOGIC_VECTOR (3 downto 0);
            sw : in std_logic_vector(3 downto 0);
            uart_rx : in std_logic;
            uart_tx : out std_logic);
 end component;
 
 signal reset_pb : std_logic;
 signal clk_in : std_logic;
 signal led : std_logic_vector (3 downto 0);
 signal uart_rx, uart_tx : std_logic;
 constant TbPeriod : time := 8 ns;
 signal TbClock : std_logic := '0';
 
begin

 dut : lab3_top port map ( -- toplevel
       reset_pb => reset_pb,
       sysclk => clk_in,
       led => led,
       sw => "0001",
       uart_rx => uart_rx,
       uart_tx => uart_tx
 ); -- dut 
 
 TbClock <= not TbClock after TbPeriod/2;
 
 clk_in <= TbClock;

 stimuli : process begin
     reset_pb <= '1';
     uart_rx <= '1'; --'1';
     wait for 232 ns;
     reset_pb <= '0'; -- '0'; 
     wait;
 end process;
 
end tb; -- architecture
