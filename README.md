This example is forked from https://github.com/microsoft/PowerBI-Developer-Samples.

It is modified to just embed an Esri ArcGIS visual from [this dashboard](https://msit.powerbi.com/groups/6d4566c7-9670-4d4d-bfe6-83092fe3d06c/dashboards/738b365e-9b22-4e78-ab3b-8292d1e4f2a4 "this dashboard").

Steps to use:
1. Ensure that you have access to the Power BI dashboard in question. If you do not, contact me at jomilose@microsoft.com.
1. Clone this solution locally.
1. Use Visual Studio to open solution pbi-saas-embed-sample.sln in directory User Owns Data\integrate-web-app\.
1. Run it with Visual Studio.

This successfully embeds the visual locally.

In contrast, [a PowerApp](https://apps.preview.powerapps.com/play/7450c45a-9f8d-4959-b206-ca2ed0c9d92b?tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&source=portal&screenColor=rgba(0%2C%20176%2C%20240%2C%201) using the same technique fails to embed the same visual. (Again if you do not have access, contact me at jomilose@microsoft.com.)


<!--

---
topic: sample
languages:
  - csharp
  - js
products:
  - dotnet-core
  - power-bi
---

[![Build Status](https://powerbi.visualstudio.com/Embedded/_apis/build/status/Devolper-Samples-Azure%20Web%20App%20for%20ASP.NET-CI?branchName=master)](https://powerbi.visualstudio.com/Embedded/_build/latest?definitionId=2824&branchName=master)

## Power BI API Code Samples

In this repository you can find sample apps explaining how to use Power BI API for developers.

Read this documentation to prepare your environment
https://docs.microsoft.com/en-us/power-bi/developer/embedding-content

Use one of the following samples to expirience the API.

You can use the instructions in each sample's directory to learn how to register an app, configure and run the sample.


## Troubleshooting

### Visual Studio 2013
To resolve a 'CS0012:Predefined type 'System.Object' is not defined or imported' error, please update web.config.

Find line:
 ```xml
 <compilation debug="true" targetFramework="4.5"/>
 ```
 
 And modify it to:
 
 ```xml
 <compilation debug="true" targetFramework="4.5">
  <assemblies>     
    <add assembly="System.Runtime, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />   
  </assemblies>
</compilation>
```

## Issues
[Power BI Support Page](https://powerbi.microsoft.com/en-us/support/)

[Power BI Ideas](https://ideas.powerbi.com)

-->
