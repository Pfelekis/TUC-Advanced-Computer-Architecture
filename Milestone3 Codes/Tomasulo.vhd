----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:17:14 10/27/2017 
-- Design Name: 
-- Module Name:    Tomasulo - Behavioral 
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

entity Tomasulo is
    Port ( clk : in  STD_LOGIC;
           instruction : in  STD_LOGIC_VECTOR (19 downto 0));
end Tomasulo;

architecture Behavioral of Tomasulo is


component Issue is
    Port ( Issue : in  STD_LOGIC;
           FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
           Fop : in  STD_LOGIC_VECTOR (1 downto 0);
           Ri : in  STD_LOGIC_VECTOR (4 downto 0);
           Rj : in  STD_LOGIC_VECTOR (4 downto 0);
           Rk : in  STD_LOGIC_VECTOR (4 downto 0);
           Accepted : out  STD_LOGIC);
end component;
 
component RSFU is
	    Port ( grantl : in STD_LOGIC;
		        granta : in STD_LOGIC;
				  acc1: in std_logic;
				  acc2: in std_logic;
				  acc3: in std_logic;
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
end component;

component RegFile is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  BusyFU : in STD_LOGIC;
			  tag : in std_logic_vector(4 downto 0);
			  Q : in std_logic_Vector(4 downto 0);
			  Qout : out std_logic_vector(4 downto 0);
			  Q2 : in std_logic_Vector(4 downto 0);
			  Qout2 : out std_logic_vector(4 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Pipeline is
    Port ( tagin : in  STD_LOGIC_VECTOR (4 downto 0);
           resultin : in  STD_LOGIC_VECTOR (31 downto 0);
           tagout : out  STD_LOGIC_VECTOR (4 downto 0);
           resultout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

Component Request_CTRL is
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
			  clk : in std_logic; 
			  
			  enout: out STD_LOGIC;
           reout : out  STD_LOGIC_VECTOR (1 downto 0));
	end component;
	
   Component Mux2 is
		 Port ( Sel : in  STD_LOGIC;
           InM1 : in  STD_LOGIC_VECTOR (31 downto 0);
           InM2 : in  STD_LOGIC_VECTOR (31 downto 0);
           OutM : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	Component DeMux6_12 is
	    Port ( Fop : in  STD_LOGIC_VECTOR (1 downto 0);
           Ri : in  STD_LOGIC_VECTOR (4 downto 0);
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
			  Fopout1 : out  STD_LOGIC_VECTOR (1 downto 0);
           Riout1 : out  STD_LOGIC_VECTOR (4 downto 0);
           Aout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Bout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Qjout1 : out  STD_LOGIC_VECTOR (4 downto 0);
           Qkout1 : out STD_LOGIC_VECTOR (4 downto 0);
			  Fopout2 : out  STD_LOGIC_VECTOR (1 downto 0);
           Riout2 : out  STD_LOGIC_VECTOR (4 downto 0);
           Aout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Bout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Qjout2 : out  STD_LOGIC_VECTOR (4 downto 0);
           Qkout2 : out STD_LOGIC_VECTOR (4 downto 0);
           Sel : in  STD_LOGIC);
	end component;
	Component Demux6_18 is
	 Port ( Fop : in  STD_LOGIC_VECTOR (1 downto 0);
			  CLK : in STD_LOGIC;
			  Issue_Acc : in std_logic;
           Ri : in  STD_LOGIC_VECTOR (4 downto 0);
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
			  Fopout1 : out  STD_LOGIC_VECTOR (1 downto 0);
           Riout1 : out  STD_LOGIC_VECTOR (4 downto 0);
           Aout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Bout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Qjout1 : out  STD_LOGIC_VECTOR (4 downto 0); 
           Qkout1 : out STD_LOGIC_VECTOR (4 downto 0);
			  Fopout2 : out  STD_LOGIC_VECTOR (1 downto 0);
           Riout2 : out  STD_LOGIC_VECTOR (4 downto 0);
           Aout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Bout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Qjout2 : out  STD_LOGIC_VECTOR (4 downto 0);
           Qkout2 : out STD_LOGIC_VECTOR (4 downto 0);
			  Fopout3 : out  STD_LOGIC_VECTOR (1 downto 0);
           Riout3 : out  STD_LOGIC_VECTOR (4 downto 0);
           Aout3 : out  STD_LOGIC_VECTOR (31 downto 0);
           Bout3 : out  STD_LOGIC_VECTOR (31 downto 0);
           Qjout3 : out  STD_LOGIC_VECTOR (4 downto 0);
           Qkout3 : out STD_LOGIC_VECTOR (4 downto 0);
			  Sel : in  STD_LOGIC_Vector(1 downto 0);
			  acc1 : out std_logic;
			  acc2 : out std_logic;
			  acc3 : out std_logic;
			  busy1 : in std_logic;
			  busy2 : in std_logic);
	end component;
		
		signal acc1,acc2,acc3,instr_en,GRANTFUL,GRANTFUA,rq1,rq2,cdbenout,busyfULA,busyrs1,dead11,dead22,dead33,busyl,enout,busya1,busya2 : std_logic ;
		signal optol,optors1,optors2,optors1a,optors2a,optors3a,optoa,busyrs12,dead44: std_logic_vector (1 downto 0);
		signal dead1,dead2,torsa,torsb,CDBVL,CDBVA,cdbV,atol,atoa,ators1,ators2,ators1a,ators2a,ators3a,btol,btoa,btors1,btors2,btors1a,btors2a,btors3a: std_logic_vector(31 downto 0);
		signal smth,CDBQL,CDBQA,POSOFQL,POSOFQA,cdbQ,tagout,torsqj,torsqk,qitol,qitoa,qitors1,qitors2,qitors1a,qitors2a,qitors3a,qjtol,qjtoa,qjtors1,qjtors2,qjtors1a,qjtors2a,qjtors3a,qktol,qktoa,qktors1,qktors2,qktors1a,qktors2a,qktors3a: std_logic_vector(4 downto 0);
		
begin

ISSUE_thing : Issue port map (
			  Issue => Instruction(0),
           FU_type => Instruction(2 downto 1),
           Fop => Instruction(4 downto 3),
           Ri => Instruction(9 downto 5),
           Rj => Instruction(14 downto 10),
           Rk => Instruction(19 downto 15),
           Accepted =>instr_en);
			  
Register_File : RegFile port map (
			  Ard1 => instruction(14 downto 10),
           Ard2 => instruction(19 downto 15),
           Awr => tagout,
           Din => cdbV,
           WrEn =>enout,
           Clk =>clk,
			  BusyFU => busyfULA,	--
			  tag =>CDBQ,
			  Q =>instruction(14 downto 10),
			  Qout =>torsqj,
			  Q2 =>instruction(19 downto 15),
			  Qout2 =>torsqk,
           Dout1 => toRSA,
           Dout2 => toRSB);
			  
DEMUX_FU 	: DeMux6_12 Port map ( 
			  Fop => instruction(4 downto 3),
           Ri  => instruction(9 downto 5),
           A   => toRSA,
           B   => toRSB,
           Qj  => torsqj,
           Qk  => torsqk,
			  Fopout1 =>optol,
           Riout1 =>qitol,
           Aout1 =>atol,
           Bout1 =>btol,
           Qjout1 =>qjtol,
           Qkout1 =>qktol,
			  Fopout2 =>optoa,
           Riout2 =>qitoa,
           Aout2 =>atoa,
           Bout2 =>btoa,
           Qjout2 =>qjtoa,
           Qkout2 =>qktoa,
           Sel =>instruction(1));
			  
DEMUX_LOGICAL 	: DeMux6_12 Port map ( 
			  Fop => optol,
           Ri  => qitol,
           A   => atol,
           B   => btol,
           Qj  => qjtol,
           Qk  => qktol,
			  Fopout1 =>optors1,
           Riout1 =>qitors1,
           Aout1 =>ators1,
           Bout1 =>btors1,
           Qjout1 =>qjtors1,
           Qkout1 =>qktors1,
			  Fopout2 =>optors2,
           Riout2 =>qitors2,
           Aout2 =>ators2,
           Bout2 =>btors2,
           Qjout2 =>qjtors2,
           Qkout2 =>qktors2,
           Sel =>'0');
			  
DEMUX_ARITHMETIC 	: DeMux6_18 Port map ( 
			  Fop => optoa,
           Ri  => qitoa,
           A   => atoa,
           B   => btoa,
           Qj  => qjtoa,
           Qk  => qktoa,
			  CLK =>clk,
			  Issue_Acc => instr_en, 
			  acc1 => acc1 ,
			  acc2 => acc2,
			  acc3 => acc3,
			  Fopout1 =>optors1a,
           Riout1 =>qitors1a,
           Aout1 =>ators1a,
           Bout1 =>btors1a,
           Qjout1 =>qjtors1a,
           Qkout1 =>qktors1a,
			  Fopout2 =>optors2a,
           Riout2 =>qitors2a,
           Aout2 =>ators2a,
           Bout2 =>btors2a,
           Qjout2 =>qjtors2a,
           Qkout2 =>qktors2a,
			  Fopout3 =>optors3a,
           Riout3 =>qitors3a,
           Aout3 =>ators3a,
           Bout3 =>btors3a,
           Qjout3 =>qjtors3a,
           Qkout3 =>qktors3a,
           Sel =>"00",
			  busy1 => busya1,
			  busy2 => busya2);   -- busya
			  
RS_FU : RSFU port map (
				  grantl =>rq1,
		        granta =>rq2,
				  CLK =>clk,
				  OP1 => optors1,
              Qi1 =>qitors1,
			     Qj1 =>qjtors1,
				  acc1 => acc1,
				  acc2 => acc2,
				  acc3 => acc3,
              Qk1 =>qktors1,
              Rj1 =>ators1,
              Rk1 =>btors1,
				  OP2 =>optors2,
              Qi2 =>qitors2,
			     Qj2 =>qktors2,
              Qk2 =>qjtors2,
              Rj2 =>ators2,
              Rk2 =>btors2,
				  op1a =>optors1a,
				  Qi1a =>qitors1a,
			     Qj1a =>qjtors1a,
              Qk1a =>qktors1a,
              Rj1a =>ators1a,
              Rk1a =>btors1a,
				  OP2a =>optors2a,
              Qi2a =>qitors2a,
			     Qj2a =>qjtors2a,
              Qk2a =>qktors2a,
              Rj2a =>ators2a,
              Rk2a =>btors2a,
				  OP3a =>optors3a,
              Qi3a =>qitors3a,
			     Qj3a =>qjtors3a,
              Qk3a =>qktors3a,
              Rj3a =>ators3a,
              Rk3a =>btors3a,
				  GRANTFUL =>GRANTFUL,
				  GRANTFUA =>GRANTFUA,
				  CDBVA => CDBVA,
				  CDBVL => CDBVL,
				  CDBQL => CDBQL,
				  CDBQA =>CDBQA,
				  POSOFQL =>POSOFQL,
				  POSOFQA =>POSOFQA,
				  busyl =>busyl ,
				  busya1 => busya1,
				  busya2 => busya2);
				  
CDB: Request_CTRL port map(
			  --data from logical
			  Data1 => CDBVL,
           tagg1 => POSOFQL,
           Qinn1 =>CDBQL,
			  --data from arithmetic
			  Data2 => CDBVA,
           tagg2 => POSOFQA,
           Qinn2 => CDBQA,
			  	--data from 3
			  Data3 => "00000000000000000000000000000000",
           tagg3 => "00000",
           Qinn3 => "00000",
			  -- data goes to CDB
			  Datout =>cdbV,
           taggout =>tagout,
           Qoutt => cdbQ,
			  --requests
			  re1 => GRANTFUL,
           re2 => GRANTFUA,
           re3 =>'0',
           re4 =>'0',
			  rq1 =>rq1,
			  rq2 =>rq2,
			  rq3 => dead11,
			  rq4 => dead22,
			  clk => clk,
			  enout => enout,
           reout =>dead44);
					
end Behavioral;

