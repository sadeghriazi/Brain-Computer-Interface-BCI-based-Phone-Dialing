#! ../prog/BCI2000Shell
@cls & ..\prog\BCI2000Shell %0 %* #! && exit /b 0 || exit /b 1\n
#######################################################################################
## $Id: P3Speller_SignalGenerator.bat 4126 2012-06-15 17:42:57Z mellinger $
## Description: BCI2000 startup Operator module script. For an Operator scripting
##   reference, see
##   http://doc.bci2000.org/index/User_Reference:Operator_Module_Scripting
##
## $BEGIN_BCI2000_LICENSE$
##
## This file is part of BCI2000, a platform for real-time bio-signal research.
## [ Copyright (C) 2000-2012: BCI2000 team and many external contributors ]
##
## BCI2000 is free software: you can redistribute it and/or modify it under the
## terms of the GNU General Public License as published by the Free Software
## Foundation, either version 3 of the License, or (at your option) any later
## version.
##
## BCI2000 is distributed in the hope that it will be useful, but
##                         WITHOUT ANY WARRANTY
## - without even the implied warranty of MERCHANTABILITY or FITNESS FOR
## A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License along with
## this program.  If not, see <http://www.gnu.org/licenses/>.
##
## $END_BCI2000_LICENSE$
#######################################################################################
Change directory $BCI2000LAUNCHDIR
Show window; Set title ${Extract file base $0}
Reset system
Startup system localhost
Start executable Emotiv --local
Start executable FieldTripBuffer --local
Start executable DummyApplication --local
##INSERT PARAMETER Application:Sequencing:StimulusTask float MinimumEvidence= 0.01 0.5 0 % // Minimum Evidence
##INSERT PARAMETER Application:Sequencing:StimulusTask int AccumulateEvidence= 1 0 0 1 // Accumulate Evidence
Wait for Connected
Load parameterfile "../parms/Emotiv_FTB_FreeSpelling.prm"
INSERT STATE StimulusCodeRes 4 0
