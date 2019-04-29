

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vending_machine_controller_tb is
--  Port ( );
end vending_machine_controller_tb;

architecture Behavioral of vending_machine_controller_tb is

-----dut declaration--------
component vending_machine_controller is 
port (  clk,rst : in bit;
	note_rm1 : in std_logic;
	cents50	: in std_logic;
	item1_rm1_but, item2_rm1_but, item3_rm1_but	: in std_logic;
	item4_rm2_but, item5_rm2_but : in std_logic;
	item1_rm1, item2_rm1, item3_rm1	: out std_logic;
	item4_rm2, item5_rm2 : out std_logic;
	cents50_out : out std_logic;
	note_rm1_out: out std_logic
);
end component;

-------signal declaration--------
signal clk_tb : bit := '0';
signal rst_tb : bit := '1';
signal note_rm1_tb : std_logic :='0';
signal cents50_tb : std_logic :='0';
signal item1_rm1_but_tb : std_logic :='0';
signal item2_rm1_but_tb: std_logic :='0'; 
signal item3_rm1_but_tb: std_logic :='0';
signal item4_rm2_but_tb: std_logic := '0';
signal item5_rm2_but_tb :  std_logic := '0';
signal 	item1_rm1_tb, item2_rm1_tb, item3_rm1_tb:  std_logic;
signal 	item4_rm2_tb, item5_rm2_tb : std_logic;
signal	cents50_out_tb : std_logic;
signal	note_rm1_out_tb: std_logic;

begin
------dut instantiaton-----------
dut : vending_machine_controller 
port map ( 
    clk => clk_tb,
    rst => rst_tb,
   note_rm1  =>note_rm1_tb,
   cents50	=> cents50_tb,
   item1_rm1_but   => item1_rm1_but_tb,
    item2_rm1_but  => item2_rm1_but_tb,
    item3_rm1_but  => item3_rm1_but_tb,
    item4_rm2_but  => item4_rm2_but_tb,
    item5_rm2_but  => item5_rm2_but_tb,
    item1_rm1     =>  item1_rm1_tb,
    item2_rm1     =>  item2_rm1_tb,
    item3_rm1     =>  item3_rm1_tb,
    item4_rm2     =>  item4_rm2_tb,
    item5_rm2     =>  item5_rm2_tb,
    cents50_out    => cents50_out_tb,
    note_rm1_out   =>   note_rm1_out_tb
    );
    
    
-----add stimuli generation here------------

clk_tb <= not clk_tb after 40ns;
rst_tb <= '0' after 80ns;

end architecture;


