@ignore
Feature:
    sample karate test script that includes SOAP calls
    to the following demo service:
    http://www.webservicex.com/stockquote.asmx?op=GetQuote

Background:
* url 'https://wfx.forevernew.com.au/Services/Forevernew.svc/soap'

Scenario: soap 1.1
Given request
"""
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="http://schemas.datacontract.org/2004/07/WFXPLMServices" xmlns:ns2="http://schemas.microsoft.com/2003/10/Serialization/Arrays" xmlns:ns3="http://tempuri.org/">
   <SOAP-ENV:Body>
      <ns3:GetPOShipmentBySKU>
         <ns3:SKUData>
            <ns1:AuthenticationToken>7C9B3130-E07B-4800-84B3-27F942E622D0</ns1:AuthenticationToken>
            <ns1:Barcodes>
               <ns2:string>2022831604088</ns2:string>
             </ns1:Barcodes>
         </ns3:SKUData>
      </ns3:GetPOShipmentBySKU>
   </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""
When soap action 'http://tempuri.org/IForevernew/GetPOShipmentBySKU'
Then status 200


* def last = //GetPOShipmentBySKU
* print last

