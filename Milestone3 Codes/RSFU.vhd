----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:31:34 10/29/2017 
-- Design Name: 
-- Module Name:    RSFU - Behavioral 
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

entity RSFU is
	    Port ( grantl : in STD_LOGIC;
		        granta : in STD_LOGIC;
				  CLK : in std_logic;
				  OP1 : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi1 : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj1 : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk1 : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj1 : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk1 : in  STD_LOGIC_VECTOR (31 downto 0);
				  OP2 : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi2 : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj2 : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk2 : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj2 : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk2 : in  STD_LOGIC_VECTOR (31 downto 0);
				  OP1a : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi1a : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj1a : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk1a : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj1a : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk1a : in  STD_LOGIC_VECTOR (31 downto 0);
				  OP2a : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi2a : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj2a : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk2a : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj2a : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk2a : in  STD_LOGIC_VECTOR (31 downto 0);
				  OP3a : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi3a : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj3a : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk3a : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj3a : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk3a : in  STD_LOGIC_VECTOR (31 downto 0);
				  acc1 : in STD_logic;
				  acc2 : in STD_logic;
				  acc3 : in STD_logic;
				  GRANTFUL : out std_logic;
				  GRANTFUA : out std_logic;
				  CDBVA : out Std_logic_vector(31 downto 0);
				  CDBVL : out std_logic_vector(31 downto 0);
				  CDBQL : out std_Logic_vector(4 downto 0);
				  CDBQA : out std_logic_vector(4 downto 0);
				  POSOFQL : out std_logic_vector(4 downto 0);
				  POSOFQA : out std_logic_vector(4 downto 0);
				  BUSYL : out std_logic;
				  BUSYA1 : out std_logic;
				  BUSYA2 : out std_logic);
end RSFU;

architecture Behavioral of RSFU is

component Reservation_Station is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
			  OPo : out  STD_LOGIC_VECTOR (1 downto 0);
			  idi : in std_logic_vector( 2 downto 0);
			  CLK : in std_logic;
			  acc : in std_logic;
           Qi : in STD_LOGIC_VECTOR (4 downto 0);
			  Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
           Rj : in  STD_LOGIC_VECTOR (31 downto 0);
           Rk : in  STD_LOGIC_VECTOR (31 downto 0);
           Vj : out  STD_LOGIC_VECTOR (31 downto 0);
           Vk : out  STD_LOGIC_VECTOR (31 downto 0);
			  Vi : out STD_LOGIC_VECTOR (4 downto 0);
			  ID : out STD_LOGIC_vector( 2 downto 0);			  
           BusyRs : out  STD_LOGIC;
			  Sent: out STD_LOGIC;
			  BusyCTR: in STD_LOGIC);
end component;

component ROB is
 Port ( ReqD : in  STD_LOGIC_VECTOR (4 downto 0);
           Value : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           ValueOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX12x4 is
    Port ( Viin1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Viin2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Vjin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vjin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Opoin1 : in  STD_LOGIC_VECTOR (1 downto 0);
           Opoin2 : in  STD_LOGIC_VECTOR (1 downto 0);
           Idin1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Idin2 : in  STD_LOGIC_VECTOR (2 downto 0);
			  Vjin3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Viin3 : in  STD_LOGIC_VECTOR (4 downto 0);
           Opoin3 : in  STD_LOGIC_VECTOR (1 downto 0);
           Idin3 : in  STD_LOGIC_VECTOR (2 downto 0);
			  busyRs1 : in STD_LOGIC;
			  busyRs2 : in STD_LOGIC;
			  busyRs3 : in STD_LOGIC;
           Vjout : out  STD_LOGIC_VECTOR (31 downto 0);
           Vkout : out  STD_LOGIC_VECTOR (31 downto 0);
           Viout : out  STD_LOGIC_VECTOR (4 downto 0);
           Opout : out  STD_LOGIC_VECTOR (1 downto 0);
           Idout : out  STD_LOGIC_VECTOR (2 downto 0);
			  busyRs : out STD_LOGIC;
           Sel_Busy1 : in  STD_LOGIC;
			  Sel_Busy2 : in  STD_LOGIC;
			  Sel_Busy3 : in  STD_LOGIC);
end component;
 
component MUX8x4 is
    Port ( Viin1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Viin2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Vjin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vjin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Opoin1 : in  STD_LOGIC_VECTOR (1 downto 0);
           Opoin2 : in  STD_LOGIC_VECTOR (1 downto 0);
           Idin1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Idin2 : in  STD_LOGIC_VECTOR (2 downto 0);
			  busyRs1 : in STD_LOGIC;
			  busyRs2 : in STD_LOGIC;
			  busyRs : out STD_LOGIC;
           Vjout : out  STD_LOGIC_VECTOR (31 downto 0);
           Vkout : out  STD_LOGIC_VECTOR (31 downto 0);
           Viout : out  STD_LOGIC_VECTOR (4 downto 0);
           Opout : out  STD_LOGIC_VECTOR (1 downto 0);
           Idout : out  STD_LOGIC_VECTOR (2 downto 0);
           Sel_Busy : in  STD_LOGIC);
end component;

component Functional_Unit_Arithmetic is
  Port (   Grant : in  STD_LOGIC;
			  Req : out STD_LOGIC;
			  busyRs : in STD_LOGIC;
           Data : out  STD_LOGIC_VECTOR (31 downto 0);
			  Vi : in std_logic_vector ( 4 downto 0);
           Vk : in  STD_LOGIC_VECTOR (31 downto 0);
			  Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
			  RSid : out std_logic_vector (4 downto 0);
			  CLK: in STD_LOGIC;
			  Tagin : in  STD_LOGIC_VECTOR (2 downto 0);
			  Busy : out STD_LOGIC;
           Tagout : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Functional_Unit_Logic is
    Port ( Grant : in  STD_LOGIC;
			  Req : out STD_LOGIC;
			  busyRs : in STD_LOGIC;
           Data : out  STD_LOGIC_VECTOR (31 downto 0);
			  Vi : in std_logic_vector ( 4 downto 0);
           Vk : in  STD_LOGIC_VECTOR (31 downto 0);
			  Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
			  RSid : out std_logic_vector (4 downto 0);
			  CLK: in STD_LOGIC;
			  Tagin : in  STD_LOGIC_VECTOR (2 downto 0);
			  Busy : out STD_LOGIC;
           Tagout : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component PipeFU is
    Port ( Viin : in  STD_LOGIC_VECTOR (4 downto 0);
           Vjin : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin : in  STD_LOGIC_VECTOR (31 downto 0);
           Opoin : in  STD_LOGIC_VECTOR (1 downto 0);
           IDin : in  STD_LOGIC_VECTOR (2 downto 0);
			  busyRsin : in STD_LOGIC;
           Viout : out  STD_LOGIC_VECTOR (4 downto 0);
           Vjout : out  STD_LOGIC_VECTOR (31 downto 0);
           Vkout : out  STD_LOGIC_VECTOR (31 downto 0);
           Opoout : out  STD_LOGIC_VECTOR (1 downto 0);
           IDout : out  STD_LOGIC_VECTOR (2 downto 0);
			  busyRs : out STD_LOGIC;
           En_Busy : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end component;

component DeMuc1_2 is
    Port ( Reset : in  STD_LOGIC;
           Reset1 : out  STD_LOGIC;
           Reset2 : out  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (1 downto 0));
end component;

component DeMux1_3 is
  Port ( 
			  Reset : in  STD_LOGIC;
           Reset1 : out  STD_LOGIC;
           Reset2 : out  STD_LOGIC;
           Reset3 : out STD_LOGIC;
			  Sel : in  STD_LOGIC_Vector(2 downto 0));
end component;

signal vjin1,vjin2,vjin1a,vjin2a,vjin3a,vkin1,vkin2,vkin1a,vkin2a,vkin3a,vj,vk,vja,vka,vjtol,vktol,vjtoa,vktoa : std_logic_vector(31 downto 0);
signal viin1,viin2,viin1a,viin2a,viin3a,vi,via,vitol,vitoa,rssid,lssid : std_logic_vector(4 downto 0);
signal idin1,idin2,idin1a,idin2a,idin3a,id,ida,idtol,idtoa,rsel : std_logic_vector(2 downto 0);
signal opo1,opo2,opo1a,opo2a,opo3a,opout,opouta,opotol,opotoa,lsel : std_logic_vector( 1 downto 0);
signal acc1a,acc2a,acc3a,busyRsL1,SentL1,BusyCTRL1,busyRsL2,SentL2,BusyCTRL2,busyRsA1,SentA1,BusyCTRA1,busyRsA2,SentA2,BusyCTRA2,busyRsA3,SentA3,BusyCTRA3,nbusyofl,busyofl,nbusyofa,busyofa,bbusy,busytoa,lbusy,busytol: std_logic;

begin

busyofa <= not(nbusyofa);
busyofl <= not(nbusyofl);


RSL1 : Reservation_Station port map (
			  acc=> acc1,
			  OP => op1,
			  OPo => opo1,
			  idi => "001",
			  CLK => clk,
           Qi => qi1,
			  Qj => qj1,
           Qk => QK1,
           Rj => Rj1,
           Rk => Rk1,
           Vj =>vjin1,
           Vk => vkin1,
			  Vi => viin1,
			  ID => idin1,			  
           BusyRs => busyRsL1,
			  Sent=>SentL1,
			  BusyCTR=>BusyCTRL1);
			  
			  
RSL2 : Reservation_Station port map (
			  acc=> acc2,
			  OP => op2,
			  OPo => opo2,
			  idi => "010",
			  CLK => clk,
           Qi => qi2,
			  Qj => qj2,
           Qk => QK2,
           Rj => Rj2,
           Rk => Rk2,
           Vj =>vjin2,
           Vk => vkin2,
			  Vi => viin2,
			  ID => idin2,			  
           BusyRs => busyRsL2,
			  Sent=>SentL2,
			  BusyCTR=>BusyCTRL2);
			  
RSA1 : Reservation_Station port map (
			  acc=> acc1,
			  OP => op1a,
			  OPo => opo1a,
			  idi => "011",
			  CLK => clk,
          Qi => qi1a,
			  Qj => qj1a,
           Qk => QK1a,
           Rj => Rj1a,
           Rk => Rk1a,
           Vj =>vjin1a,
           Vk => vkin1a,
			  Vi => viin1a,
			  ID => idin1a,			  
           BusyRs => busyRsA1,
			  Sent=>SentA1,
			  BusyCTR=>BusyCTRA1);
			  
RSA2 : Reservation_Station port map (
			  acc=> acc2,
			  OP => op2a,
			  OPo => opo2a,
			  idi => "100",
			  CLK => clk,
           Qi => qi2a,
			  Qj => qj2a,
           Qk => QK2a,
           Rj => Rj2a,
           Rk => Rk2a,
           Vj =>vjin2a,
           Vk => vkin2a,
			  Vi => viin2a,
			  ID => idin2a,			  
           BusyRs => busyRsA2,
			  Sent=>SentA2,
			  BusyCTR=>BusyCTRA2);
			  
RSA3 : Reservation_Station port map (
			  acc=> acc3,
			  OP => op3a,
			  OPo => opo3a,
			  idi => "101",
			  CLK => clk,
           Qi => qi3a,
			  Qj => qj3a,
           Qk => QK3a,
           Rj => Rj3a,
           Rk => Rk3a,
           Vj =>vjin3a,
           Vk => vkin3a,
			  Vi => viin3a,
			  ID => idin3a,			  
           BusyRs => busyRsA3,
			  Sent=>SentA3,
			  BusyCTR=>BusyCTRA3);

MUXL : MUX8x4 port map (
			  Viin1 => viin1,
           Viin2 => viin2,
           Vjin1 => vjin1,
           Vjin2 => vjin2,
           Vkin1 => vkin1,
           Vkin2 => vkin2,
           Opoin1 => opo1,
           Opoin2 => opo2,
           Idin1  => idin1,
           Idin2 => idin2,
			  busyrs1 => SentL1,
			  busyrs2 => SentL2,
			  busyrs => lbusy,
           Vjout => vj,
           Vkout => vk,
           Viout => vi,
           Opout => opout,
           Idout => id,
           Sel_Busy => SentL1); 
			  
MUXA : MUX12x4 port map (
			  Viin1 => viin1a,
           Viin2 => viin2a,
			  Viin3 => viin3a,
           Vjin1 => vjin1a,
           Vjin2 => vjin2a,
			  Vjin3 => vjin3a,
           Vkin1 => vkin1a,
           Vkin2 => vkin2a,
			  Vkin3 => vkin3a,
           Opoin1 => opo1a,
           Opoin2 => opo2a,
			  opoin3 => opo3a,
           Idin1  => idin1a,
           Idin2 => idin2a,
			  idin3 => idin3a,
			  busyrs1 => SentA1,
			  busyrs2 => SentA2,
			  busyrs3 => SentA3,
			  busyrs => bbusy,
           Vjout => vja,
           Vkout => vka,
           Viout => via,
           Opout => opouta,
           Idout => ida,
           Sel_Busy1 => SentA1,
			  Sel_Busy2 => SentA2,
			  sel_busy3 => SentA3);		---why2 sel?
			  
PIPEL : PipeFU port map (
			  Viin => vi,
           Vjin => vj,
           Vkin => vk,
           Opoin => opout,
           IDin => id,
			  busyrsin => lbusy,
			  busyrs => busytol,
           Viout => vitol,
           Vjout => vjtol,
           Vkout => vktol,
           Opoout => opotol,
           IDout => idtol,
           En_Busy => busyofl,
           clk =>clk);
			  
PIPEA : PipeFU port map (
			  Viin => via,
           Vjin => vja,
           Vkin => vka,
           Opoin => opouta,
           IDin => ida,
			  busyrsin => bbusy,
			  busyrs => busytoa,
           Viout => vitoa,
           Vjout => vjtoa,
           Vkout => vktoa,
           Opoout => opotoa,
           IDout => idtoa,
           En_Busy => busyofA,
           clk =>clk);

FUL : Functional_Unit_Logic Port map (
			  Grant => grantl,
			  Req => GRANTFUL,
           Data => CDBVL,
			  busyrs => busytol,
			  Vi => vitol,
           Vk => vktol,
			  Vj => vjtol,
           Op => opotol,
			  RSid => CDBQL,
			  CLK => clk,
			  Tagin => idtol,
			  Busy => nbusyofL,
           Tagout => POSOFQL);
			  
FUA : Functional_Unit_Arithmetic Port map (
			  Grant => granta,
			  Req => GRANTFUA,
			  busyrs => busytoa,		--Sent
           Data => CDBVA,
			  Vi => vitoa,
           Vk => vktoa,
			  Vj => vjtoa,
           Op => opotoa,
			  RSid => rssid,
			  CLK => clk,
			  Tagin => idtoa,
			  Busy => nbusyofA,
           Tagout => POSOFQA);

  CDBQA <= rssid;
		rsel <= rssid(2 downto 0);
		
	CDBQL <= lssid;
		lsel <= lssid(1 downto 0);

Reset_FUA:DEMUX1_3 
  Port map( 
			  Reset => busyofA,
           Reset1 => Busyctra1,
           Reset2 => busyctra2,
           Reset3 => busyctra3,
			  Sel => rsel);
			  
Reset_FUL : Demuc1_2 port map (
			  Reset => busyofL,
			  Reset1 => busyctrl1,
			  Reset2 => busyctrl2,
			  sel => lsel);
			  
			  busya1 <= busyRsA1;
			  busya2 <= busyRsA2;
			  busyl <= busyrsl1;			  
			 

end Behavioral;

