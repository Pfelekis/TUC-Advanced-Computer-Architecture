--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:30:24 10/30/2017
-- Design Name:   
-- Module Name:   C:/.Xilinx/Project/Architecture/RSFU_Test.vhd
-- Project Name:  Architecture
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RSFU
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
 
ENTITY RSFU_Test IS
END RSFU_Test;
 
ARCHITECTURE behavior OF RSFU_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RSFU
    PORT(
         grantl : IN  std_logic;
         granta : IN  std_logic;
         CLK : IN  std_logic;
         OP1 : IN  std_logic_vector(1 downto 0);
         Qi1 : IN  std_logic_vector(4 downto 0);
         Qj1 : IN  std_logic_vector(4 downto 0);
         Qk1 : IN  std_logic_vector(4 downto 0);
         Rj1 : IN  std_logic_vector(31 downto 0);
         Rk1 : IN  std_logic_vector(31 downto 0);
         OP2 : IN  std_logic_vector(1 downto 0);
         Qi2 : IN  std_logic_vector(4 downto 0);
         Qj2 : IN  std_logic_vector(4 downto 0);
         Qk2 : IN  std_logic_vector(4 downto 0);
         Rj2 : IN  std_logic_vector(31 downto 0);
         Rk2 : IN  std_logic_vector(31 downto 0);
         OP1a : IN  std_logic_vector(1 downto 0);
         Qi1a : IN  std_logic_vector(4 downto 0);
         Qj1a : IN  std_logic_vector(4 downto 0);
         Qk1a : IN  std_logic_vector(4 downto 0);
         Rj1a : IN  std_logic_vector(31 downto 0);
         Rk1a : IN  std_logic_vector(31 downto 0);
         OP2a : IN  std_logic_vector(1 downto 0);
         Qi2a : IN  std_logic_vector(4 downto 0);
         Qj2a : IN  std_logic_vector(4 downto 0);
         Qk2a : IN  std_logic_vector(4 downto 0);
         Rj2a : IN  std_logic_vector(31 downto 0);
         Rk2a : IN  std_logic_vector(31 downto 0);
         OP3a : IN  std_logic_vector(1 downto 0);
         Qi3a : IN  std_logic_vector(4 downto 0);
         Qj3a : IN  std_logic_vector(4 downto 0);
         Qk3a : IN  std_logic_vector(4 downto 0);
         Rj3a : IN  std_logic_vector(31 downto 0);
         Rk3a : IN  std_logic_vector(31 downto 0);
         GRANTFUL : OUT  std_logic;
         GRANTFUA : OUT  std_logic;
         CDBVA : OUT  std_logic_vector(31 downto 0);
         CDBVL : OUT  std_logic_vector(31 downto 0);
         CDBQL : OUT  std_logic_vector(4 downto 0);
         CDBQA : OUT  std_logic_vector(4 downto 0);
         POSOFQL : OUT  std_logic_vector(4 downto 0);
         POSOFQA : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal grantl : std_logic := '0';
   signal granta : std_logic := '0';
   signal CLK : std_logic := '0';
   signal OP1 : std_logic_vector(1 downto 0) := (others => '0');
   signal Qi1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Qj1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Qk1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Rk1 : std_logic_vector(31 downto 0) := (others => '0');
   signal OP2 : std_logic_vector(1 downto 0) := (others => '0');
   signal Qi2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Qj2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Qk2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Rk2 : std_logic_vector(31 downto 0) := (others => '0');
   signal OP1a : std_logic_vector(1 downto 0) := (others => '0');
   signal Qi1a : std_logic_vector(4 downto 0) := (others => '0');
   signal Qj1a : std_logic_vector(4 downto 0) := (others => '0');
   signal Qk1a : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj1a : std_logic_vector(31 downto 0) := (others => '0');
   signal Rk1a : std_logic_vector(31 downto 0) := (others => '0');
   signal OP2a : std_logic_vector(1 downto 0) := (others => '0');
   signal Qi2a : std_logic_vector(4 downto 0) := (others => '0');
   signal Qj2a : std_logic_vector(4 downto 0) := (others => '0');
   signal Qk2a : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj2a : std_logic_vector(31 downto 0) := (others => '0');
   signal Rk2a : std_logic_vector(31 downto 0) := (others => '0');
   signal OP3a : std_logic_vector(1 downto 0) := (others => '0');
   signal Qi3a : std_logic_vector(4 downto 0) := (others => '0');
   signal Qj3a : std_logic_vector(4 downto 0) := (others => '0');
   signal Qk3a : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj3a : std_logic_vector(31 downto 0) := (others => '0');
   signal Rk3a : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal GRANTFUL : std_logic;
   signal GRANTFUA : std_logic;
   signal CDBVA : std_logic_vector(31 downto 0);
   signal CDBVL : std_logic_vector(31 downto 0);
   signal CDBQL : std_logic_vector(4 downto 0);
   signal CDBQA : std_logic_vector(4 downto 0);
   signal POSOFQL : std_logic_vector(4 downto 0);
   signal POSOFQA : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RSFU PORT MAP (
          grantl => grantl,
          granta => granta,
          CLK => CLK,
          OP1 => OP1,
          Qi1 => Qi1,
          Qj1 => Qj1,
          Qk1 => Qk1,
          Rj1 => Rj1,
          Rk1 => Rk1,
          OP2 => OP2,
          Qi2 => Qi2,
          Qj2 => Qj2,
          Qk2 => Qk2,
          Rj2 => Rj2,
          Rk2 => Rk2,
          OP1a => OP1a,
          Qi1a => Qi1a,
          Qj1a => Qj1a,
          Qk1a => Qk1a,
          Rj1a => Rj1a,
          Rk1a => Rk1a,
          OP2a => OP2a,
          Qi2a => Qi2a,
          Qj2a => Qj2a,
          Qk2a => Qk2a,
          Rj2a => Rj2a,
          Rk2a => Rk2a,
          OP3a => OP3a,
          Qi3a => Qi3a,
          Qj3a => Qj3a,
          Qk3a => Qk3a,
          Rj3a => Rj3a,
          Rk3a => Rk3a,
          GRANTFUL => GRANTFUL,
          GRANTFUA => GRANTFUA,
          CDBVA => CDBVA,
          CDBVL => CDBVL,
          CDBQL => CDBQL,
          CDBQA => CDBQA,
          POSOFQL => POSOFQL,
          POSOFQA => POSOFQA
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		 grantl <='1';
       granta <='1';
		 OP1a<="00";
		 Qi1a<="00010";
		 Qj1a<="00000";
		 Qk1a<="00000"; 
		 Rj1a<="00000000000000000000000000000111";
		 Rk1a<="00000000000000000000000000011101";
		 
		 
		 grantl <='1';
       granta <='1';
		 OP1<="00";
		 Qi1<="00011"; 
		 Qj1<="00000";
		 Qk1<="00000"; 
		 Rj1<="00000000000000000000000000000101";
		 Rk1<="00000000000000000000000000110001";

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
