--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:40:45 12/09/2017
-- Design Name:   
-- Module Name:   C:/.Xilinx/Project/Architecture/Rob_test3.vhd
-- Project Name:  Architecture
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROB
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
 
ENTITY Rob_test3 IS
END Rob_test3;
 
ARCHITECTURE behavior OF Rob_test3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB
    PORT(
         RegD : IN  std_logic_vector(4 downto 0);
         InstrType : IN  std_logic_vector(1 downto 0);
         Value : IN  std_logic_vector(31 downto 0);
         Ready : IN  std_logic;
         clk : IN  std_logic;
         Issue_index_out : IN  std_logic_vector(2 downto 0);
         RegD_out : IN  std_logic_vector(4 downto 0);
         Value_Out : IN  std_logic_vector(31 downto 0);
         InstrType_Out : IN  std_logic_vector(1 downto 0);
         Ready_out : IN  std_logic;
         Issue_index_out1 : OUT  std_logic_vector(2 downto 0);
         RegDout : OUT  std_logic_vector(4 downto 0);
         ValueOut : OUT  std_logic_vector(31 downto 0);
         InstrTypeOut : OUT  std_logic_vector(1 downto 0);
         Readyout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RegD : std_logic_vector(4 downto 0) := (others => '0');
   signal InstrType : std_logic_vector(1 downto 0) := (others => '0');
   signal Value : std_logic_vector(31 downto 0) := (others => '0');
   signal Ready : std_logic := '0';
   signal clk : std_logic := '0';
   signal Issue_index_out : std_logic_vector(2 downto 0) := (others => '0');
   signal RegD_out : std_logic_vector(4 downto 0) := (others => '0');
   signal Value_Out : std_logic_vector(31 downto 0) := (others => '0');
   signal InstrType_Out : std_logic_vector(1 downto 0) := (others => '0');
   signal Ready_out : std_logic := '0';

 	--Outputs
   signal Issue_index_out1 : std_logic_vector(2 downto 0);
   signal RegDout : std_logic_vector(4 downto 0);
   signal ValueOut : std_logic_vector(31 downto 0);
   signal InstrTypeOut : std_logic_vector(1 downto 0);
   signal Readyout : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB PORT MAP (
          RegD => RegD,
          InstrType => InstrType,
          Value => Value,
          Ready => Ready,
          clk => clk,
          Issue_index_out => Issue_index_out,
          RegD_out => RegD_out,
          Value_Out => Value_Out,
          InstrType_Out => InstrType_Out,
          Ready_out => Ready_out,
          Issue_index_out1 => Issue_index_out1,
          RegDout => RegDout,
          ValueOut => ValueOut,
          InstrTypeOut => InstrTypeOut,
          Readyout => Readyout
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
      wait for 100 ns;	
		
		 RegD <="00001";
       InstrType <="00";
		 Issue_index_out <= "000";
		 wait for clk_period;
		 Issue_index_out <= "001";
		 RegD <="00010";
       InstrType <="01";
		 wait for clk_period;
		 Value    <="00000000000000000000000000000101";
       Ready <= '1';
		 RegD <="00000";
       InstrType <="00";
		 wait for clk_period;
		 Value    <="00000000000000000000000000000000";
       Ready <= '0';
       InstrType_Out <="00";
       RegD_out <= "00001";
		 Value_out <="00000000000000000000000000000101";
       Ready_out <= '1';
		 wait for clk_period;
		 Value_out <="00000000000000000000000000000000";
       Regd_out <= "00000";
		 Value    <="00000000000000000000000000000111";
       Ready <= '1';
       wait for clk_period;
		 Value    <="00000000000000000000000000000000";
       Ready <= '0';
       InstrType_Out <="00";
       RegD_out <= "00010";
		 Value_out <="00000000000000000000000000000111";
       Ready_out <= '1';
       wait for clk_period;
		 Value_out    <="00000000000000000000000000000000";
       Regd_out <= "00000";

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
