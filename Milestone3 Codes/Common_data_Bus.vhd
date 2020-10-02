----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:14:43 10/27/2017 
-- Design Name: 
-- Module Name:    Common_data_Bus - Behavioral 
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

entity Common_data_Bus is
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
end Common_data_Bus;

architecture Behavioral of Common_data_Bus is

--component Mux9_3 is 
-- Port ( Datain1 : in  STD_LOGIC_VECTOR (31 downto 0);
--           tag1 : in  STD_LOGIC_VECTOR (4 downto 0);
--           Qin1 : in  STD_LOGIC_VECTOR (4 downto 0);
--           Datain2 : in  STD_LOGIC_VECTOR (31 downto 0);
--           tag2 : in  STD_LOGIC_VECTOR (4 downto 0);
--           Qin2 : in  STD_LOGIC_VECTOR (4 downto 0);
--           Datain3 : in  STD_LOGIC_VECTOR (31 downto 0);
--           tag3 : in  STD_LOGIC_VECTOR (4 downto 0);
--           Qin3 : in  STD_LOGIC_VECTOR (4 downto 0);
--			  Sel: in STD_LOGIC_VECTOR (1 downto 0);
--			  Dataout : out  STD_LOGIC_VECTOR (31 downto 0);
--           tagout : out  STD_LOGIC_VECTOR (4 downto 0);
--           Qout : out  STD_LOGIC_VECTOR (4 downto 0));
--end component Mux9_3;

begin

process(clk)
begin -- process
	-- activities triggered by asynchronous reset (active high)
	if clk'event and clk = '1' then
		if rq=NOT("11") then 
			data<= Datain;	
			Qout <= Qin;
			tagout <=tag;
			wren <= '1';
			gr<='1';
			
		else 
			wren <= '0';
		end if;
	end if;
end process;







end Behavioral;

