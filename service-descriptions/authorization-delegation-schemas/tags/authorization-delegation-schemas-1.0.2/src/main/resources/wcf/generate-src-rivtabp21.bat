
	@REM ---------------------------------------------------------------------------------
	@REM Generates c# WCF service contracts (interface), client proxies and wcf config
	@REM file for the WSDLs + XML Schemas of the service domain, using .Net WCF tool svcuti.exe
	@REM ---------------------------------------------------------------------------------
    @REM Copyright 2010 Västra Götalandsregionen This library is free software; you can redistribute it and/or modify it
    @REM under the terms of version 2.1 of the GNU Lesser General Public License as published by the Free Software
    @REM Foundation. This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
    @REM even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General
    @REM Public License for more details. You should have received a copy of the GNU Lesser General Public License along
    @REM with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
    @REM 02111-1307 USA
	@REM ---------------------------------------------------------------------------------
	CD ..
	
	SET SCHEMADIR=schemas
	
	SET W0=%SCHEMADIR%\interactions\SaveDelegationsInteraction\SaveDelegationsInteraction_1.0_RIVTABP21.wsdl
SET X0=%SCHEMADIR%\interactions\SaveDelegationsInteraction\*.xsd

SET XCORE=%SCHEMADIR%\core_components\*.xsd

SET SCHEMAS=%XCORE% %W0% %X0% 

SET OUTFILE=/out:wcf\generated-src\AuthorizationDelegationInteractions.cs
SET APPCONFIG=/config:wcf\generated-src\app.config
SET NAMESPACE=/namespace:*,Riv.Authorization.Delegation.Schemas.v1
SET SVCUTIL="svcutil.exe"
%SVCUTIL% /language:cs %OUTFILE% %APPCONFIG% %NAMESPACE% %SCHEMAS%

CD wcf
ECHO Generating Service contract .Net Binding interfaces and classes for authorization:delegation Release 1
ECHO I DotNetprojektet ska du ta lagga till referens till System.ServiceModel
