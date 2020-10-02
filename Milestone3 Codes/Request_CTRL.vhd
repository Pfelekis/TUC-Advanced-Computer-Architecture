----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:51:36 10/27/2017 
-- Design Name: 
-- Module Name:    Request_CTRL - Behavioral 
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

entity Request_CTRL is
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
			  rq1 :out STD_LOGIC;
			  rq2 :out STD_LOGIC;
			  rq3 :out STD_LOGIC;
			  rq4 :out STD_LOGIC;
			  enout: out STD_LOGIC;
			  clk : in std_logic;
           reout : out  STD_LOGIC_VECTOR (1 downto 0));
end Request_CTRL;

architecture Behavioral of Request_CTRL is

component Reg2 is
		Port ( Data : in  STD_LOGIC_VECTOR (1 downto 0);
             CLK : in  STD_LOGIC;
             Dout : out  STD_LOGIC_VECTOR (1 downto 0);
             Enable : in  STD_LOGIC);
end component;

component Mux9_3 is 
 Port ( Datain1 : in  STD_LOGIC_VECTOR (31 downto 0);
           tag1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qin1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Datain2 : in  STD_LOGIC_VECTOR (31 downto 0);
           tag2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qin2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Datain3 : in  STD_LOGIC_VECTOR (31 downto 0);
           tag3 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qin3 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Sel: in STD_LOGIC_VECTOR (1 downto 0);
			  Dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           tagout : out  STD_LOGIC_VECTOR (4 downto 0);
           Qout : out  STD_LOGIC_VECTOR (4 downto 0));
end component Mux9_3;

type state is(state1,state2,state3);
signal Mux_out,temp1,temp2,temp3,retemp :STD_LOGIC_vector(1 downto 0);	
signal current_state, next_state : state;
begin
--
--	Reg1 :	Reg2 port map ( Data => Mux_out,
--									 Enable => '1',
--						          Clk => Clk,
--						          Dout => temp1);
--	Regg2 :	Reg2 port map ( Data => temp1,
--									 Enable => '1',
--						          Clk => Clk,
--						          Dout => temp2);
--	Reg3 :	Reg2 port map ( Data => temp2,
--									 Enable => '1',
--						          Clk => Clk,
--						          Dout => temp3);

									
process(current_state,re1,re2,re3)
	begin
	case current_state is
		when state1 =>
			If(re1='1') then 	--we have request from 1
				reout<= "00";
				retemp<= "00";
				rq1<='1';
				rq2<='0';
				enout<='1';
				next_state <= state2;
				
			elsif(re2='1') then
				reout <= "01";
				retemp<="01";
				rq2<='1';
				rq1<='0';
				enout<='1';
				next_state <= state3;
			elsif(re3='1') then
				reout <="10";
				retemp<="10";
				enout<='1';
				next_state <=state1;
				rq3<='1'; --request3
			else
				rq2<='0';
				rq1<='0';
				enout<='0';
				next_state <= state2;
			end if;
		when state2 =>
			If(re2='1') then 	--we have request from 2
				reout<= "01";
				retemp<= "01";
				enout<='1';
				next_state <= state3;
				rq2<='1'; 
				rq1<='0';
			elsif (re3='1') then
				reout <= "10";
				retemp<= "10";
				rq3<='1';
				enout<='1';
				next_state <= state1;
			else
				rq2<='0';
				rq1<='0';
				enout<='0';
				next_state <= state3;
			end if;
		when state3 =>
			rq2<='0';
			rq1<='0';
			If(re3='1') then 	--we have request from 3
				reout<= "10";
				retemp<= "10";
				rq3<='1';
				enout<='1';
				next_state <= state1;
				
			else
				enout<='0';
				next_state <= state1;
			end if;
		end case;
		end process;
 	process(CLK)
	begin
		if (CLK'EVENT and CLK = '1') then
			current_state <= next_state;
		end if;
	end process;
--retemp <= reout;

CDBMUX : Mux9_3 port map ( Datain1 => data1,
									tag1 => tagg1,
									Qin1 => Qinn1,
									Datain2 => data2,
									tag2 => tagg2,
									Qin2 => Qinn2,
									Datain3 => data3,
									tag3 => tagg3,
									Qin3 => Qinn3,
									Sel => retemp,
									Dataout => Datout,
									tagout => taggout,
									Qout => Qoutt);


end Behavioral;

