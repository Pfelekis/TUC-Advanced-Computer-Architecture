--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:34:40 10/29/2017
-- Design Name:   
-- Module Name:   C:/.Xilinx/Project/Architecture/RequestTest.vhd
-- Project Name:  Architecture
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Request_CTRL
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
 
ENTITY RequestTest IS
END RequestTest;
 
ARCHITECTURE behavior OF RequestTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Request_CTRL
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
         Datout : OUT  std_logic_vector(31 downto 0);
         taggout : OUT  std_logic_vector(4 downto 0);
         Qoutt : OUT  std_logic_vector(4 downto 0);
         re1 : IN  std_logic;
         re2 : IN  std_logic;
         re3 : IN  std_logic;
         re4 : IN  std_logic;
         rq1 : OUT  std_logic;
         rq2 : OUT  std_logic;
         rq3 : OUT  std_logic;
         rq4 : OUT  std_logic;
         clk : IN  std_logic;
         reout : OUT  std_logic_vector(1 downto 0)
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
   signal Datout : std_logic_vector(31 downto 0);
   signal taggout : std_logic_vector(4 downto 0);
   signal Qoutt : std_logic_vector(4 downto 0);
   signal rq1 : std_logic;
   signal rq2 : std_logic;
   signal rq3 : std_logic;
   signal rq4 : std_logic;
   signal reout : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Request_CTRL PORT MAP (
          Data1 => Data1,
          tagg1 => tagg1,
          Qinn1 => Qinn1,
          Data2 => Data2,
          tagg2 => tagg2,
          Qinn2 => Qinn2,
          Data3 => Data3,
          tagg3 => tagg3,
          Qinn3 => Qinn3,
          Datout => Datout,
          taggout => taggout,
          Qoutt => Qoutt,
          re1 => re1,
          re2 => re2,
          re3 => re3,
          re4 => re4,
          rq1 => rq1,
          rq2 => rq2,
          rq3 => rq3,
          rq4 => rq4,
          clk => clk,
          reout => reout
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
		Data1 <= "00000000000000000000000000110000";
		tagg1 <= "10000";
		Qinn1 <= "10000";
		Data2 <= "00000000000000000000000000000011";
		tagg2 <= "11100";
		Qinn2 <= "11100";
		Data3 <= "00000000000000000000000000011111";
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
