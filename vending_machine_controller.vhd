----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2019 11:48:36
-- Design Name: 
-- Module Name: vending_machine_controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity vending_machine_controller is 
Port( clk,rst : in bit;
	note_rm1 : in std_logic;
	cents50	: in std_logic;
	item1_rm1_but, item2_rm1_but, item3_rm1_but	: in std_logic;
	item4_rm2_but, item5_rm2_but : in std_logic;
	item1_rm1, item2_rm1, item3_rm1	: out std_logic;
	item4_rm2, item5_rm2 : out std_logic;
	cents50_out : out std_logic;
	note_rm1_out: out std_logic
);
end entity;

architecture fsm of vending_machine_controller is 
Type state is (st0, st50, st100, st150, st200,st250);
Signal pr_state,nxt_state: state;
Attribute enum_encoding: STRING;
Attribute enum_encoding of state : Type is "Sequential";

begin

----------sequential cct----------------=

	process(clk,rst)
		begin
			if (rst='1') then
				 pr_state <= st0;
			elsif (clk='1' and clk 'event) then
				pr_state <= nxt_state;
			end if;
	end process;

------combinational cct---------------

	process(pr_state,cents50, note_rm1)
		begin
			Case pr_state is 
				when st0 => 
				item1_rm1 <= '0';
				item2_rm1 <='0';
				item3_rm1 <='0';
				item4_rm2 <='0';
				item5_rm2 <='0';
				if (cents50 ='1') then
					nxt_state <= st50;
				elsif(note_rm1='1') then 
					nxt_state <=st100;
				end if;
				
				when st50 =>
				item1_rm1 <='0';
				item2_rm1 <='0';
				item3_rm1 <='0';
				item4_rm2 <='0';
				item5_rm2 <='0';
				if (cents50='1') then 
					nxt_state<= st100;
				elsif(note_rm1='1') then
					nxt_state<= st150;
				end if;
				
				when st100 =>
				item4_rm2 <='0';
				item5_rm2 <= '0';
				if (item1_rm1_but ='1') then
					item1_rm1 <= '1';
					nxt_state <= st0;
				elsif (item2_rm1_but = '1') then
					item2_rm1 <= '1';
					nxt_state <= st0;
				elsif (item3_rm1_but = '1') then
					item3_rm1 <= '1';
					nxt_state <= st0;
					if (cents50 = '1') then 
						nxt_state <= st150;
					elsif(note_rm1='1') then  
						nxt_state <= st250;
					end if;
				end if;
		
				when st150 =>
				item4_rm2 <='0';
				item5_rm2 <= '0';
				if (item1_rm1_but ='1') then
					item1_rm1 <= '1';
					cents50_out <= '1';
					nxt_state <= st0;
				elsif (item2_rm1_but = '1') then
					item2_rm1 <= '1';
					cents50_out <= '1';
					nxt_state <= st0;
				elsif (item3_rm1_but = '1') then
					item3_rm1 <= '1';
					cents50_out <= '1';
					nxt_state <= st0;
					if (cents50='1') then 
						nxt_state <= st200;
					elsif (note_rm1= '1') then
						nxt_state <= st250;
					end if;
				end if;

				when st200 => 
				if (item1_rm1_but ='1') then
					item1_rm1 <= '1';
					note_rm1_out <= '1';
				elsif (item2_rm1_but = '1') then
					item2_rm1 <= '1';
					note_rm1_out <= '1';
				elsif (item3_rm1_but = '1') then
					item3_rm1 <= '1';
					note_rm1_out <= '1';
				elsif (item4_rm2_but ='1') then
					item4_rm2 <='1';
				elsif (item5_rm2_but ='1') then 
					item5_rm2 <= '1';
				end if;
					nxt_state <= st0;

				when st250 => 
				item1_rm1 <='0';
				item2_rm1 <='0';
				item3_rm1 <='0';
				if (item4_rm2_but ='1') then
					item4_rm2 <='1';
					cents50_out <= '1';
					nxt_state <= st0;
				elsif (item5_rm2_but='1') then 
					item5_rm2 <= '1';
					cents50_out <= '1';
					nxt_state <= st0;
				end if;
	
			end case;
		end process;
end architecture;	

				





