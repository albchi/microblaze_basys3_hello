library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity lab3_top is
	Port (  
		reset_pb 	: in STD_LOGIC;
		sysclk   	: in STD_LOGIC;	
		led  	    : out STD_LOGIC_VECTOR (3 downto 0);
		sw          : in std_logic_vector(3 downto 0);
		uart_rx     : in std_logic;
		uart_tx     : out std_logic
	);
end lab3_top;


architecture Behavioral of lab3_top is
	-- signal ctr : unsigned(3 downto 0);
	-- signal clk,rst,ena_2Hz : std_logic;
	signal reset, rxd, txd : std_logic;


	--component clkdivider is
	--  generic (divideby    : natural := 2);
	--  port (  clk          : in std_logic;
	--	      reset       : in std_logic;
	--	      pulseout    : out std_logic);
	-- end component;


component ubsys is port (
    Clk : in STD_LOGIC;
    gpio_rtl_0_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gpio_rtl_1_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    reset : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC);
end component ;
    --component design_ub_2 is port (
      --  Clk                         : in std_logic;
        --dip_switches_16bits_tri_i   : in std_logic_vector(15 downto 0);
        --led_16bits_tri_o            : out std_logic_vector(15 downto 0);
        --reset                       : in std_logic;
        --usb_uart_rxd                : in std_logic;
        --usb_uart_txd                : out std_logic); 
    --end component;
begin

	-- clk <= sysclk;
	-- rst <= not reset_pb;
	
	--make2Hz: clkdivider 
	--   generic map (divideby => 62500000)
	--   port map (
	--       clk => clk, 
	--       reset=> rst, 
	--       pulseout => ena_2hz
	 --  );


    --design_ub_2_0 : design_ub_2  port map (
    --    Clk                         => clk,
    --    dip_switches_16bits_tri_i   => sw,
    --    led_16bits_tri_o            => led,
    --    reset                       => reset,
    --    usb_uart_rxd                => rxd,
    --    usb_uart_txd                => txd 
    --);
    
    ubsys_0 : ubsys port map (
       Clk => sysclk,
       gpio_rtl_0_tri_i => sw, 
       gpio_rtl_1_tri_o => led,
       reset => reset_pb,
       usb_uart_rxd => uart_rx, 
       usb_uart_txd => uart_tx    
    );

	-- just a silly counter for demo purposes
	
	-- process(clk,rst)
	-- begin
	--	if rst='1' then
	--		ctr <= (others=>'0');
	--	elsif rising_edge(clk) then
	--		if ena_2hz='1' then
	--			ctr <= ctr + 1;
	--		end if;
	--	end if;
	-- end process;

end Behavioral;
