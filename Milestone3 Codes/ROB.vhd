----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:12:02 11/29/2017 
-- Design Name: 
-- Module Name:    ROB - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROB is
    Port ( RegD : in  STD_LOGIC_VECTOR (4 downto 0):="00000";
			  InstrType : in  STD_LOGIC_VECTOR (1 downto 0);
           Value : in  STD_LOGIC_VECTOR (31 downto 0);
           Ready : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  Issue_index_out: in STD_logic_Vector(2 downto 0);
			  RegD_out : in STD_LOGIC_VECTOR (4 downto 0);
           Value_Out : in  STD_LOGIC_VECTOR (31 downto 0);
			  InstrType_Out : in STD_LOGIC_VECTOR(1 downto 0);
			  Ready_out : in STD_LOGIC;
			  Issue_index_out1: out STD_logic_Vector(2 downto 0);
			  RegDout : out STD_LOGIC_VECTOR (4 downto 0);
           ValueOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  InstrTypeOut : out STD_LOGIC_VECTOR(1 downto 0);
			  Readyout : out STD_LOGIC);
end ROB;

architecture Behavioral of ROB is

component BOB is
 Port (    RegD : in  STD_LOGIC_VECTOR (4 downto 0);
           Value : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  WE : in std_logic;
			  En : in std_logic;
			  reset : in std_logic;
           RegDo : out  STD_LOGIC_VECTOR (4 downto 0);
           Valueo : out  STD_LOGIC_VECTOR (31 downto 0);
           InstrTypeo : out  STD_LOGIC_VECTOR (1 downto 0);
           Readyo : out  STD_LOGIC);
end component;
 
component DecROB is
Port ( 	  InD : in  STD_LOGIC_VECTOR (2 downto 0);
           OutD : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX8_1 is		--out
    Port ( 
	        RegD0 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value0 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType0 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready0 : in  STD_LOGIC;
			   RegD1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value1 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType1 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready1 : in  STD_LOGIC;
			   RegD2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value2 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType2 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready2 : in  STD_LOGIC;
			   RegD3 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value3 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType3 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready3 : in  STD_LOGIC;
			   RegD4 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value4 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType4 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready4: in  STD_LOGIC;
			   RegD5 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value5 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType5 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready5 : in  STD_LOGIC;
			   RegD6 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value6 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType6 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready6 : in  STD_LOGIC;
			   RegD7 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value7 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType7 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready7 : in  STD_LOGIC;
			   RegD : out  STD_LOGIC_VECTOR (4 downto 0);
           Value : out  STD_LOGIC_VECTOR (31 downto 0);
           InstrType : out  STD_LOGIC_VECTOR (1 downto 0);
           Ready : out  STD_LOGIC;
			  sel : in std_Logic_vector(2 downto 0));
end component;

Signal enables,enablesc,resets: std_logic_vector(7 downto 0);

signal regd0,regd1,regd2,regd3,regd4,regd5,regd6,regd7,regddead : std_logic_vector(4 downto 0);
signal value0,value1,value2,value3,value4,value5,value6,value7,valuedead : std_logic_vector (31 downto 0);
signal ready0,ready1,ready2,ready3,ready4,ready5,ready6,ready7,mux_ready : std_logic;
signal instr0,instr1,instr2,instr3,instr4,instr5,instr6,instr7,instrtypedead : std_logic_vector(1 downto 0);


type state is(NOP,Issue,Commit,Both,Full);
signal Issue_index,Commit_index,commit_reset : std_logic_vector (2 downto 0):="000";

signal current_state, next_state : state;


begin

Enables_ISSUE : DecROB port map (
			inD => Issue_index,
			outD => Enables);
			
Enables_COMMIT : DecROB port map (
			inD => Commit_index,
			outD => Enablesc);
			
			
commit_reset <= commit_index-1;		
	
Resets_ROB  : DecROB port map (
			inD => Commit_reset,
			outD => resets);

Buffer_0 : BOB  port map (
			  RegD => RegD,
           Value => Value,
           InstrType => InstrType,
           Ready => Ready,
			  clk => clk,
			  WE => '1',
			  En => '1',
			  reset => resets(0),
           RegDo => regd0,
           Valueo => value0,
           InstrTypeo => instr0,
           Readyo => ready0);

Buffer_1 : BOB  port map (
			  RegD => RegD,
           Value => Value,
           InstrType => InstrType,
           Ready => Ready,
			  clk => clk,
			  WE => '1',
			  En => '1',
			  reset => resets(1),
           RegDo => regd1,
           Valueo => value1,
           InstrTypeo => instr1,
           Readyo => ready1);

Buffer_2 : BOB  port map (
			  RegD => RegD,
           Value => Value,
           InstrType => InstrType,
           Ready => Ready,
			  clk => clk,
			  WE => enables(2),
			  En => enablesc(2),
			  reset => resets(2),
           RegDo => regd2,
           Valueo => value2,
           InstrTypeo => instr2,
           Readyo => ready2);

Buffer_3 : BOB  port map (
			  RegD => RegD,
           Value => Value,
           InstrType => InstrType,
           Ready => Ready,
			  clk => clk,
			  WE => enables(3),
			  En => enablesc(3),
			  reset => resets(3),
           RegDo => regd3,
           Valueo => value3,
           InstrTypeo => instr3,
           Readyo => ready3);
		
Buffer_4 : BOB  port map (
			  RegD => RegD,
           Value => Value,
           InstrType => InstrType,
           Ready => Ready,
			  clk => clk,
			  WE => enables(4),
			  En => enablesc(4),
			  reset => resets(4),
           RegDo => regd4,
           Valueo => value4,
           InstrTypeo => instr4,
           Readyo => ready4);

Buffer_5 : BOB  port map (
			  RegD => RegD,
           Value => Value,
           InstrType => InstrType,
           Ready => Ready,
			  clk => clk,
			  WE => enables(5),
			  En => enablesc(5),
			  reset => resets(5),
           RegDo => regd5,
           Valueo => value5,
           InstrTypeo => instr5,
           Readyo => ready5);

Buffer_6 : BOB  port map (
			  RegD => RegD,
           Value => Value,
           InstrType => InstrType,
           Ready => Ready,
			  clk => clk,
			  WE => enables(6),
			  En => enablesc(6),
			  reset => resets(6),
           RegDo => regd6,
           Valueo => value6,
           InstrTypeo => instr6,
           Readyo => ready6);

Buffer_7 : BOB  port map (
			  RegD => RegD,
           Value => Value,
           InstrType => InstrType,
           Ready => Ready,
			  clk => clk,
			  WE => enables(7),
			  En => enablesc(7),
			  reset => resets(7),
           RegDo => regd7,
           Valueo => value7,
           InstrTypeo => instr7,
           Readyo => ready7);
			  
Commit_MUX : MUX8_1 port map (
	        RegD0 =>regd0,
			  Value0 => value0,
           InstrType0  => instr0,
           Ready0 => ready0,
			   RegD1 => regd1,
           Value1 => value1,
           InstrType1 => instr1,
           Ready1 => ready1,
			   RegD2 =>regd2,
           Value2 => value2,
           InstrType2 => instr2,
           Ready2 => ready2,
			   RegD3 => regd3,
           Value3 => value3,
           InstrType3 => instr3,
           Ready3 => ready3,
			   RegD4 => regd4,
           Value4 => value4,
           InstrType4 => instr4,
           Ready4 => ready4,
			   RegD5 => regd5,
           Value5 => value5,
           InstrType5 => instr5,
           Ready5 => ready5,
			   RegD6 => regd6,
           Value6 => value6,
           InstrType6 => instr6,
           Ready6 => ready6,
			   RegD7 => regd7,
           Value7 => value7,
           InstrType7 => instr7,
           Ready7 => ready7,
			   RegD => RegDout,
           Value => ValueOut,
           InstrType => InstrTypeOut,
           Ready => ReadyOut,
			  sel => Commit_index);
			  
	ISSUE_MUX : MUX8_1 port map (
	        RegD0 =>regd0,
			  Value0 => value0,
           InstrType0  => instr0,
           Ready0 => ready0,
			   RegD1 => regd1,
           Value1 => value1,
           InstrType1 => instr1,
           Ready1 => ready1,
			   RegD2 =>regd2,
           Value2 => value2,
           InstrType2 => instr2,
           Ready2 => ready2,
			   RegD3 => regd3,
           Value3 => value3,
           InstrType3 => instr3,
           Ready3 => ready3,
			   RegD4 => regd4,
           Value4 => value4,
           InstrType4 => instr4,
           Ready4 => ready4,
			   RegD5 => regd5,
           Value5 => value5,
           InstrType5 => instr5,
           Ready5 => ready5,
			   RegD6 => regd6,
           Value6 => value6,
           InstrType6 => instr6,
           Ready6 => ready6,
			   RegD7 => regd7,
           Value7 => value7,
           InstrType7 => instr7,
           Ready7 => ready7,
			   RegD => RegDdead,
           Value => Valuedead,
           InstrType => InstrTypedead,
           Ready => MUX_ready,
			  sel => ISSUE_index);
			  
process(current_state,RegD)
	begin
	case current_state is
		when NOP =>
			
			If(RegD="00000" AND Mux_ready='0') then
				next_state <= NOP;
			elsif(RegD="00000" AND Mux_ready='1') then
				next_state <= Commit;
			elsif(RegD/="00000" AND Mux_ready='0') then
				next_state <= Issue;
			else
				next_state <= Both;
			end if;		
		when Commit =>
			  --enable exit
			  --enable mux commit
			  --reset
			  if (Commit_index= "111") then
					Commit_index <="000";
				else
			  Commit_index <= Commit_index + 1;
			  end if;
				next_state <= NOP;
		When Issue =>
			 -- fill buffer
			 --enable mux issue
			 --Ready=0 signal?
			 
			  If (Commit_index - Issue_index= 1) then
					next_state<= Full;
			  elsif (Issue_index= "111") then
					Issue_index <="000";
					next_state <=NOP;
			  else
					Issue_index <= Commit_index + 1;
					next_state <=NOP;
			  end if;
		When Full =>
			 -- Wait for ready(commit)
			 --if ready=1 next_state commit
			 next_state <= NOP;
		When Both =>
			  --enable exit
			  --reset
			  ------------------
			  --commit
			  If (Commit_index= "111") then
					Commit_index <="000";
					next_state <=NOP;
				else
					Commit_index <= Commit_index + 1;
					next_state <=NOP;
			  end if;
			  
			  --------------
			  --issue
			  
			  If (Commit_index - Issue_index= 1) then
					next_state<= Full;
			  elsif (Issue_index= "111") then
					Issue_index <="000";
					next_state <=NOP;
			  else
					Issue_index <= Commit_index + 1;
					next_state <=NOP;
			  end if; 
		
		end case;
		end process;
		
 	process(CLK)
	begin
		if (CLK'EVENT and CLK = '1') then
			current_state <= next_state;
		end if;
	end process;

end Behavioral;

