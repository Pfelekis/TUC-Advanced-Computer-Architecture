----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:57:25 10/28/2017 
-- Design Name: 
-- Module Name:    CDB_toplvl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CDB_toplvl is
Port ( --data from 1
			  Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           tagg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qinn1 : in  STD_LOGIC_VECTOR (4 downto 0);
			  --data from 2
			  Data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           tagg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qinn2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  	--data from 3
			  Data3 : in  STD_LOGIC_VECTOR (31 downto 0);
           tagg3 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qinn3 : in  STD_LOGIC_VECTOR (4 downto 0);
			  --requests
			  re1 : in  STD_LOGIC;
           re2 : in  STD_LOGIC;
           re3 : in  STD_LOGIC;
           re4 : in  STD_LOGIC;
			  clk : in std_logic;
			  --output
			  wren : out std_logic;
           Qout : out  STD_LOGIC_VECTOR (4 downto 0);
			  tagout : out  STD_LOGIC_VECTOR (4 downto 0);
			  Data : out STD_LOGIC_VECTOR (31 downto 0);
			  gr : out std_logic); --grand access
end CDB_toplvl;

architecture Behavioral of CDB_toplvl is

component Request_CTRL is
			Port ( --data from 1
			  Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           tagg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qinn1 : in  STD_LOGIC_VECTOR (4 downto 0);
			  --data from 2
			  Data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           tagg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qinn2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  	--data from 3
			  Data3 : in  STD_LOGIC_VECTOR (31 downto 0);
           tagg3 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qinn3 : in  STD_LOGIC_VECTOR (4 downto 0);
			  -- data goes to CDB
			  	  --data from 2
			  Datout : out  STD_LOGIC_VECTOR (31 downto 0);
           taggout : out  STD_LOGIC_VECTOR (4 downto 0);
           Qoutt : out  STD_LOGIC_VECTOR (4 downto 0);
			  --requests
			  re1 : in  STD_LOGIC;
           re2 : in  STD_LOGIC; 
           re3 : in  STD_LOGIC;
           re4 : in  STD_LOGIC;
			  clk : in std_logic;
           reout : out  STD_LOGIC_VECTOR (1 downto 0));
			end component;
component Common_data_Bus is
			 Port ( clk   : in std_logic;
			  -- CDB out 
			  wren : out std_logic;
           Qout : out  STD_LOGIC_VECTOR (4 downto 0);
			  tagout : out  STD_LOGIC_VECTOR (4 downto 0);
			  Data : out STD_LOGIC_VECTOR (31 downto 0);
			  -- request in/out
			  rq : in std_logic_vector (1 downto 0);
			  gr : out std_logic;
			  -- Data from FU
			  Datain: in STD_LOGIC_VECTOR (31 downto 0);
			  tag : in STD_LOGIC_VECTOR ( 4 downto 0);
			  Qin : in STD_LOGIC_VECTOR (4 downto 0)
			  );
			end component;
Signal temp1,temp2 : STD_LOGIC_VECTOR (4 downto 0);
Signal temp3 : STD_LOGIC_VECTOR (31 downto 0);
Signal temp4 : STD_LOGIC_VECTOR (1 downto 0);
begin

Requests : Request_CTRL port map(
			  Data1 =>Data1,
           tagg1 =>tagg1,
           Qinn1 =>Qinn1,
			  --data from 2
			  Data2 =>Data2,
           tagg2 =>tagg2,
           Qinn2 => Qinn2,
			  	--data from 3
			  Data3 =>Data3,
           tagg3 =>tagg3,
           Qinn3 => Qinn3,
			  re1 =>re1,
			  re2 =>re2,
			  re3 => re3,
			  re4 =>re4,
			  clk =>clk,
			  Datout =>temp3,
			  taggout =>temp1,
			  Qoutt =>temp2,
			  reout =>temp4);
ToCDB : Common_data_Bus port map(
			clk=>clk,
			rq => temp4,
			Datain => temp3,
			tag => temp1,
			Qin => temp2,
			wren => wren,
         Qout => Qout,
			tagout => tagout,
			Data => Data,
			gr=>gr);
			  
				
end Behavioral;

