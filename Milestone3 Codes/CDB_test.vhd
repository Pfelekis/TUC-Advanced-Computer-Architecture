--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:00:49 10/29/2017
-- Design Name:   
-- Module Name:   C:/.Xilinx/Project/Architecture/CDB_Test.vhd
-- Project Name:  Architecture
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CDB_toplvl
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
 
ENTITY CDB_Test IS
END CDB_Test;
 
ARCHITECTURE behavior OF CDB_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CDB_toplvl
    PORT(
         Data1 : IN  std_logic_vector(31 downto 0);
         tagg1 : IN  std_logic_vector(4 downto 0);
         Qinn1 : IN  std_logic_vector(4 downto 0);
         Data2 : IN  std_logic_vector(31 downto 0);
         tagg2 : IN  std_logic_vector(4 downto 0);
         Qinn2 : IN  std_logic_vector(4 downto 0);
         Data3 : IN  std_logic_vector(31 downto 0);
         tagg3 : IN  std_logic_vector(4 downto 0);
         Qinn3 : IN  std_logic_vector(4 downto 0);
         re1 : IN  std_logic;
         re2 : IN  std_logic;
         re3 : IN  std_logic;
         re4 : IN  std_logic;
         clk : IN  std_logic;
         wren : OUT  std_logic;
         Qout : OUT  std_logic_vector(4 downto 0);
         tagout : OUT  std_logic_vector(4 downto 0);
         Data : OUT  std_logic_vector(31 downto 0);
         gr : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Data1 : std_logic_vector(31 downto 0) := (others => '0');
   signal tagg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Qinn1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Data2 : std_logic_vector(31 downto 0) := (others => '0');
   signal tagg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Qinn2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Data3 : std_logic_vector(31 downto 0) := (others => '0');
   signal tagg3 : std_logic_vector(4 downto 0) := (others => '0');
   signal Qinn3 : std_logic_vector(4 downto 0) := (others => '0');
   signal re1 : std_logic := '0';
   signal re2 : std_logic := '0';
   signal re3 : std_logic := '0';
   signal re4 : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal wren : std_logic;
   signal Qout : std_logic_vector(4 downto 0);
   signal tagout : std_logic_vector(4 downto 0);
   signal Data : std_logic_vector(31 downto 0);
   signal gr : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CDB_toplvl PORT MAP (
          Data1 => Data1,
          tagg1 => tagg1,
          Qinn1 => Qinn1,
          Data2 => Data2,
          tagg2 => tagg2,
          Qinn2 => Qinn2,
          Data3 => Data3,
          tagg3 => tagg3,
          Qinn3 => Qinn3,
          re1 => re1,
          re2 => re2,
          re3 => re3,
          re4 => re4,
          clk => clk,
          wren => wren,
          Qout => Qout,
          tagout => tagout,
          Data => Data,
          gr => gr
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
		Data1 <= "11000000000000000000000000000000";
		tagg1 <= "10000";
		Qinn1 <= "10000";
		Data2 <= "00000000000000000000000000000011";
		tagg2 <= "11100";
		Qinn2 <= "11100";
		Data3 <= "11111000000000000000000000000000";
		tagg3 <= "11111";
		Qinn3 <= "11111";
		re1<='0';
		re2<='1';
		re3<='1';
		wait for clk_period;
		re1<='1';
		re2<='0';
		re3<='1';
		wait for clk_period;
		re2<='1';
		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
