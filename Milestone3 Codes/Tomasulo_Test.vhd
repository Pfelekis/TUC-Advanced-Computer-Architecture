--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:20:03 10/31/2017
-- Design Name:   
-- Module Name:   C:/.Xilinx/Project/Architecture/Tomasulo_Test.vhd
-- Project Name:  Architecture
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Tomasulo
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL; 
 
ENTITY Tomasulo_Test IS
END Tomasulo_Test;
 
ARCHITECTURE behavior OF Tomasulo_Test IS  
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Tomasulo
    PORT(
         clk : IN  std_logic;
         instruction : IN  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal instruction : std_logic_vector(19 downto 0) := (others => '0');

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Tomasulo PORT MAP (
          clk => clk,
          instruction => instruction
        );

   -- Clock process definitions 
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 95 ns;	 
		instruction <="00011001010110000011";
		wait for clk_period;
	wait for clk_period;
		wait for clk_period;
	wait for clk_period;
		wait for clk_period;
		wait for clk_period;
		instruction <="00011011001010000011";
		wait for clk_period;
--		wait for clk_period;
--		wait for clk_period;
--		wait for clk_period;
--		wait for clk_period;
--		wait for clk_period;
		instruction <="00000000000000000000";
	--	instruction <="00001001011001000011"; 
      wait for clk_period;
   --	instruction <="00001001011001000011";
		
		
		--	instruction <="00001001011001000011";
      wait for clk_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
