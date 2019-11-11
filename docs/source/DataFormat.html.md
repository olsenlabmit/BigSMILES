---
title: BigSMILES Data Format

language_tabs: # must be one of https://git.io/vQNgJ
  - json: BigSMILES Data

toc_footers:
  - <a href='index.html'>BigSMILES Project</a>
  - <a href='line_notation.html'>BigSMILES Line Notation</a>
  - <a href='DataFormat.html'>BigSMILES Data Format</a>
  - <a href='https://github.com/olsenlabmit/bigSMILES'>GitHub</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:

search: true
---

# Introduction

The [BigSMILES line notation](line_notation.html) provides a compact representation scheme in plain text for expressing the composition and connectivity of polymers and the chemical structures of their constituent repeating units. However, while the text representations provide comprehensive descriptions on how distinct repeating units interconnect to form macromolecular fragments, each BigSMILES representation specifies only the unweighted ensemble of molecular states (individual molecular connectivity realizations) permissible by the connectivity rules defined within the string, and the bare BigSMILES strings do not explicitly contain any information on the relative weight or probability of each molecular state. Therefore, to fully specify a polymeric system, additional quantifications on the distributional properties of the polymer, such as the degree of polymerization or the dispersity, must be provided in addition to the BigSMILES string. 

This document provides the official documentation of the BigSMILES data format, a data standard that accompanies the BigSMILES line notation. 

<aside class="success">This page is mainly meant for developers. For BigSMILES users that are looking to generate BigSMILES data files, please go to the <a href="https://olsenlabmit.github.io/BigSMILES_DataForm/">BigSMILES Data Form</a> for a more user friendly interface.
</aside>



# The BigSMILES Data Format

> A BigSMILES data file stores data in the following format

```json
{	
    "BigSMILES" : "CC{[$]$CC$,$CC(C)$[$]}",
	"log" : [log1,log2,...],
	"id" : "XXXX-XXX",
	"src" : ["source-of-data"],
	...
	"data" : [data1,data2,...]
}
```

> where the terms *log1*, *log2*, *data1*, *data2* are placeholders for JSON objects that contain log entries and individual data with characterization of the structural properties of a polymer. Their exact syntax will be introduced in later sections.
>
> The following example provides an  expanded version with explicit objects, 

```json 
{	
    "BigSMILES" : "CC{[$]$CC$,$CC(C)$[$]}{[<]>OCC<[>]}O",
	"log" : [{"author_id":"921312906","date":"2019-10-16","msg":"file first created."},
             {"author_id":"921312906","date":"2019-10-17","msg":"new examples"} ],
	"id" : "polymer-100.1",
	"src" : ["doi:10.1021/acscentsci.9b00476","doi:10.1021/acs.macromol.8b01676"],

	"data" : [
              {
               "target":"[CH3:/1][CH2:/2][CH2:/3][CH2:/4]{[$][$:/5.1/4][CH2:/5.1/3][CH2:/5.1/2][$:/5.1/1][$]}[NH2:/8]",
               "source" :"[CH3:/1][CH2:/2][CH2:/3][CH2:/4]{[$][$:/5.1/4][CH2:/5.1/3][CH2:/5.1/2][$:/5.1/1][$]}[CH2:/6][CH3:/7]",
               "Mn" : [{"value":4.4,
                       "unit":"kDa",
                       "uncertainty":0.5,
                       "uncertainty_src":"multiple samples from the same batch",
                       "method": "GPC" }],
               "D" : [{"value": 1.1, 
                      "uncertainty": 0.1, 
                      "uncertainty_src": "uncertainty in GPC calibration"}]
              },
              {
               "target":"{[CH3:/1][CH2:/2][CH2:/3][CH2:/4]{[$][$:/5.1/4][CH2:/5.1/3][CH2:/5.1/2][$:/5.1/1][$]}[OH:/8]",
               "source" :"[CH3:/1][CH2:/2][CH2:/3][CH2:/4]{[$][$:/5.1/4][CH2:/5.1/3][CH2:/5.1/2][$:/5.1/1][$]}[CH2:/6][CH3:/7]",
               "Mw" : [{"value":10,
                       "unit":"kDa",
                       "uncertainty":0.5,
                       "uncertainty_src":"multiple samples from the same batch",
                       "method": "GPC" }],
               "D" : [{"value": 1.5}] 
              } 
    		 ]
}
```

The major aim of the BigSMILES data format is to provide a standard language for the storage of chemical structure related characterization for polymers. In the data file, the data entries are stored in JSON format.

In JSON, multiple name-value pairs are saved in a comma-delimited list. Unless otherwise specified, all lists within the BigSMILES data format are considered unordered (even for arrays). This improves flexibility and minimize overhead burden in transforming existing records into the standard data format.

An illustrative BigSMILES data JSON file example is shown in the code block. In the rest of the document, a JSON file/object that describes a single polymer is referred to as the ***main JSON object***.

<aside class="success">Remember — Each BigSMILES JSON file contains data and characterization for exactly one polymer. Multiple polymers that appear within one literature should be encoded within separate files. </aside>
In BigSMILES data format, relevant data is stored within different entries according to their nature. On the highest level, data are classified into two major different categories:

- **metadata** associated with the data file itself, such as the document identifier, the source of the data, or other information relevant to the maintenance of the data file itself, and
- **data** or parameters that provide characterization of the chemical structure of the polymer

where the name-value pairs of the metadata, such as the BigSMILES string of the polymer, the author, the document identifier, etc., are directly stored on the top level of the JSON file (more details on the definition of some standard metadata entries will be provided shortly), and the physicochemical properties relevant to the characterization of the chemical structure are encapsulated and compiled within the "data" entry. 

<aside class="notice">The order of which each individual entry appears does not matter; as long as each entry is denoted by a comma-delimited list of name (specified by a string within quotation marks) and value pairs separated by colons, they are considered equally valid.</aside>
# Metadata 

> The metadata section of a BigSMILES data file has the following format

```json
{	
	"BigSMILES" : "CC{[$]$CC$,$CC(C)$[$]}",
	"log" : [{"author_id":"921312906","date":"2019-10-16","msg":"file first created."},
             {"author_id":"921312906","date":"2019-10-17","msg":"new examples"} ],
	"id" : "XXXX-XXX",
	"src" : ["source 1", "source 2", "source3"],
	"other metadata1" : "value1",
	"other metadata2" : 2.0,
	"other metadataN" : ["valueN1","valueN2","valueN3"]
}
```

A list of useful metadata entries are provided in this section. However, it should be noted that the provided list is very basic and not intended to be comprehensive. Additional metadata entries beyond the provided list can be incorporated depending on the specific needs of individual projects. Standardization are provided for these to serve as a guideline for recording the essential information. 

| Name                    | Type   | Description                                                  |
| ----------------------- | ------ | ------------------------------------------------------------ |
| [BigSMILES](#bigsmiles) | string | The BigSMILES string for the polymer.                        |
| [id](#id)               | string | An identifier for the document to serve as document reference id in database or file systems. |
| [src](#src)             | array  | The source of the data.                                      |
| [log](#log)             | array  | An array that contains the revision log of the document.     |

<aside class="notice">It is strongly recommended that these provided entries are incorporated within every data file, because they provide basic information that allows for verification of the data entries for each created polymer, as well as serving as digital trails for document curation purposes.</aside>
## BigSMILES

> Syntax and usage

```json
"BigSMILES" : "{<OCC>;>[H],<O}"
"BigSMILES" : "CC{[$]$CC$,$CC(C)$[$]}"
```

BigSMILES holds the BigSMILES string generated by the [BigSMILES line notation](BigSMILES_LineNotation.md) that describes the basic chemical connectivity pattern between constituent units for a polymer.

**Type**

string



## id

> Syntax and usage

```json
"id" : "1100583"
"id" : "Polymer-0-05"
```

id holds a string that serves as an identifier for the document. It should correspond to the unique identifier in a database or the file identifier in a file system or data repository.

**Type**

string



## src

> Syntax and usage

```json
"src" : ["10.1021/acscentsci.9b00476","10.1021/acs.macromol.8b01676"]
```

src holds an array of strings that specifies the source(s) of the raw data. 

In academic settings, the DOI number associated with the reference literatures could be a good choice of unambiguous specification of the source; for industry or individual organizations, DOI can be replaced by the internal document identifier of the relevant documents.

**Type**

array of strings



## log

> Syntax and usage
>
> Author represented as numerical identifiers

```json
"log" : [
    {"author_id":["921312906","9527"],"date":"2019-10-16","msg":"file first created."},
    {"author_id":["921312906"],"date":"2019-10-17","msg":"new examples"}, 
    {"author_id":["921312906"],"date":"2019-10-19","msg":"more examples"} 
]
```

> or authors with their names explicitly included

```json
"log" : [
    {"author_id":["Tzyy-Shyang Lin"],
     "date":"2019-10-07",
     "msg":"document first created"},
    {"author_id":["Tzyy-Shyang Lin","Bradley Olsen"],
     "date":"2019-10-10",
     "msg":"first revision, modified kinetics section"}, 
    {"author_id":["MONET Team"],
     "date":"2019-10-20",
     "msg":"first publishable version"}
]
```

log holds the log of the revisions of the document. 

The log consists of an array of *log objects*. Each log object is a JSON object that contains the following entries:

- author_id (array of string)
  A list of the identifier for the authors (represented as strings) of the revision of the document. Depending on the application, the authors can be represented by 
  - ORCID
  - employee id
  - ... or any other suitable identifier (such as names of the author)
- date (string)
  represented by a string in the "yyyy-mm-dd" format
- msg (string)
  a string logging necessary information or message associated with the revision

**Type**

array of *log object*

<aside class="notice">Using names as author identifiers are strongly discouraged, because they are often not unique and difficult to track. Unique identifiers such as ORCID are preferred.</aside>

# Data and the Data Object

> The data objects are embedded within the main JSON object

```json
{	
	"BigSMILES" : "CC{[$]$CC$,$CC(C)$[$]}",
	"log" : [{"author_id":"921312906","date":"2019-10-16","msg":"file first created."},
             {"author_id":"921312906","date":"2019-10-17","msg":"new examples"} ],
	"id" : "XXXX-XXX",
	"src" : ["source 1", "source 2", "source3"],
	"other metadata1" : "value1",
	"data" : [data_obj1,data_obj2,...]
}
```

> Each data object follows the following syntax

```json
{
    "target":"{...}",
    "source":"{...}",
    "Mn" : [{"value":4.4,
            "unit":"kDa",
            "uncertainty":0.5,
            "uncertainty_src":"multiple samples from the same batch",
            "method": "GPC" }],
    "D" : [{"value": 1.1, 
           "uncertainty": 0.1, 
           "uncertainty_src": "uncertainty in GPC calibration"}] ,
	"kinetics" : [{"parameter1":"value1", "description": "description-text"}]
}
```

> The "target" and "source" entries are always required, whereas other entries related to properties are included depending on availability.  Note that although only two properties (number average molecular weight and dispersity) are included in the example, in general, all relevant properties should be included. 

In the BigSMILES data format, the data associated with the molecular structures of the polymers are encapsulated within the "data" entry with an array of ***data objects*** in the following syntax

`"data" : [data_obj1, data_obj2, data_obj3,...]`

and placed within the major JSON object, as illustrated in the example. Each data object corresponds to a set of characterization data of the polymer of interest or a precursor related to the logged polymer. The data object encapsulates properties and parameters that are relevant to the determination of the distribution of different molecular states within the ensemble given by the line notation. The syntax for the data object is illustrated in the example panel.



Each data object is consisted of the following three types of entries:

1. indexing entries (the "target" and "source" entries) 
   * target:  
     the labelled BigSMILES string of the polymer segment or precursor on which the physicochemical measurements are actually performed
   * source:  
     the labelled BigSMILES string of the original polymer (the one specified in the "BigSMILES" entry). 
   * source and target should be labelled consistently such that the corresponding atoms on the two BigSMILES strings have the identical index
2. measurable properties that provide characterization of the chemical structure of the polymer, such as number average molecular weight, dispersity, ... etc.
3. properties or parameters that provide information that could be used to infer the chemical structure of a polymer, but are model dependent and become meaningless outside of the context of a specific physicochemical model

The entries in the first two categories are directly listed within the data object (analogous to the metadata entries in the main JSON object), whereas the parameters that are model dependent are encapsulated within a "kinetics" entry.  

<aside class="notice">Remember - The order of the entries do not matter!</aside>
## Indexing a Polymeric Segment

> For each data object, the "target" and "source" entries must be included

```json
data_obj = 
{	
	"target" : "[CH3:/1][CH2:/2][CH2:/3][CH2:/4]{[$][$:/5.1/4][CH2:/5.1/3][CH2:/5.1/2][$:/5.1/1][$]}[NH2:/8]",
	"source" : "[CH3:/1][CH2:/2][CH2:/3][CH2:/4]{[$][$:/5.1/4][CH2:/5.1/3][CH2:/5.1/2][$:/5.1/1][$]}[CH2:/6][CH3:/7]",
	"Mn" : 	[{"value":4.4, ...}],
    "D" : 	[{"value": 1.1, ...}],
	"kinetics" : [{...}]
}
```

> As detailed within the specification, any scheme that satisfy the requirements could be used to provide labelling of the target and source polymers. 
>
> For instance, the following example describes a target polymer of amine functionalized polyethylene and a source polymer with ethyl end groups instead of the amine end:

```json
"target" : "[CH3:/1][CH2:/2][CH2:/3][CH2:/4]{[$][$:/5.1/4][CH2:/5.1/3][CH2:/5.1/2][$:/5.1/1][$]}[NH2:/8]",
"source" : "[CH3:/1][CH2:/2][CH2:/3][CH2:/4]{[$][$:/5.1/4][CH2:/5.1/3][CH2:/5.1/2][$:/5.1/1][$]}[CH2:/6][CH3:/7]"
```

In each data object, the exact element or component of the polymer that the properties are associated with is given by the `target` and `source` entries. 

| Entry Name | Type   | Description                                                  |
| ---------- | ------ | ------------------------------------------------------------ |
| target     | string | The labelled BigSMILES string of the polymer segment or precursor on which the physicochemical measurements are actually performed |
| source     | array  | The labelled BigSMILES string of the original polymer (the one specified in the "BigSMILES" entry). |

In principle, the BigSMILES data format is designed to store quantifications obtained directly from experimental measurements. The "target" entry is designed to contain the BigSMILES string of the exact polymer molecule that the measurements are performed on. 



However, for polymers, it is common that characterizations are performed on precursors or polymers that are not exactly identical to the actual polymer of interest. This is especially common for polymers that undergo post-characterization functionalization, or polymers segments that have been grafted or tethered to other polymer segments. In these cases, the target polymer would not be the same as the polymer of interest, and may contain parts or atoms that could not necessarily be found in the polymer of interest.

<aside class="notice">In this case, the the BigSMILES string within the target field would not be substrings of the original BigSMILES string.</aside>
To unambiguously specify which of the atom(s) on the polymer of interest do each atom on the target polymer correspond to, a map between the atoms on the target polymer and the atoms on the polymer of interest (the source polymer) must be provided. The mapping is provided by labelling the BigSMILES string of the target polymer and the BigSMILES string of the original polymer. 

For the purpose of the data standard, any labelling scheme could be used as long as the labelling scheme satisfies the following criteria:

1. For a BigSMILES string, each atom and bonding descriptor should be assigned an unique string label. 
2. For any atom on the target polymer that has correspondence on the source polymer, the label for the atom on target should be identical to the label of the corresponding atom on source 
3. For any atom on the target polymer that does not have a corresponding atom on the source polymer, the label for such atom should not match any label on the source polymer

For BigSMILES users, a tool with graphical interface that could consistently generate valid labels can be found [here](https://olsenlabmit.github.io/BigSMILES_builder/).

<aside class="warning">The target and atom_idx entries are required for every data object.</aside>
## Measurable Properties

> Relevant properties can be included within the list of entries in a data object

```json
data_obj = 
{	
	"target" : "...",
	"source" : "...",
	"Mn" : 	[{"value":4.4, ...}],
    "D" : 	[{"value": 1.1, ...}],
	"kinetics" : [{...}]
}
```

> For each property, please refer to corresponding sections for detailed syntax.



Characterization on measurable properties are logged under the corresponding array within the data object. For each measurable property, the set of required and optional fields are slightly different. Please click on the name of the property in the table to view the exact syntax.

<aside class="warning">Currently, properties such as tacticity, head-to-tail configuration and composition are not supported. These are actively under development and should be available soon.</aside>

| Property              | Description                                                  |
| --------------------- | ------------------------------------------------------------ |
| [D](#d)               | Dispersity                                                   |
| [Mn](#mn)             | Number average molecular weight                              |
| [Mw](#mw)             | Weight average molecular weight                              |
| [Mz](#mz)             | Z average molecular weight                                   |
| [DPn](#dpn)           | Number average degree of polymerization                      |
| [DPw](#dpw)           | Weight average degree of polymerization                      |
| [DPz](#dpz)           | Z average degree of polymerization                           |
| [skewness](#skewness) | The skewness of the molecular weight distribution            |
| [kurtosis](#kurtosis) | The kurtosis of the molecular weight distribution            |
| [MWD](#mwd)           | The full molecular weight distribution                       |
| [GPC](#gpc)           | The GPC measurement data for polymer molecular weight distribution |
| [p](#p)               | The extent of reaction                                       |

<aside class="warning">BigSMILES data format is designed specifically for describing the structural features of polymers. Therefore, properties, such as the viscosity, that are not directly relevant to the structure should <b>NOT</b> be included within the data objects.</aside>
<aside class="warning">Unlike the metadata list, to ensure maximal compatibility, incorporating entries not contained within the supported properties list is strongly discouraged. If there are missing fields that you consider necessary, please submit a modification or update request, and we will incorporate the new entry into the standard list as soon as possible.</aside>

## Model Dependent Parameters

> The kinetic object can contain any user defined parameters that are relevant to the specific kinetic model. The only requirement is that the object contain either a description that details the exact definitions of each parameter and how they work with a specific kinetic model, or a reference to another document that contains such information.

```json
kinetic_obj = 
{	
	"src" : "source-to-model-description",
    "desc":	"description of the model",
    "parameter1" : "value1",
	"parameter2" : "value2",
	...
}
```



As discussed earlier, the data object should only explicitly contain properties that are not model dependent. Meanwhile, other parameters, such as the reactive rate constants (which are meaningful only under the context of a certain kinetic model, reaction mechanism and other assumptions), although not objectively quantitative, may also provide means to infer the relative weights of the molecular states in an ensemble. To include these information, the following syntax can be used:

`"kinetics": kinetics object`

However, since each kinetic model is highly specific and often vastly different from other models both in terms of the nature and number of parameters required, standardization for the ***kinetics object*** is currently not supported, and the user is free to define and include any parameter as deemed necessary. The only strict requirement is that the kinetics object must contain an entry that either clearly specifies the exact definitions of each parameter and how they work with a specific kinetic model to inform the molecular structures, or provide a reference to another document that details such information.



# List of Supported Data Entries

## Common fields

For every property, the following fields are always included. Therefore, they will not be repeated in later sections.

**Object Fields**

| Name | Type   | Option   | Description                             |
| ---- | ------ | -------- | --------------------------------------- |
| src  | string | optional | the source of the data within the entry |

## D

> Syntax and usage

```json
"D" : {
    "value" : 1.1,
    "uncertainty" : 0.1,
    "uncertainty_src" : "uncertainty of GPC calibration",
    "method" : "GPC"
}
```

Dispersity of the selected polymeric segment.

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the dispersity                          |
| uncertainty     | number | optional | the uncertainty of the provided dispersity                   |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |
| method          | string | optional | how the value is measured or obtained                        |



## Mn

> Syntax and usage

```json
"Mn" : {
    "value" : 4.4,
    "unit" : "kDa",
    "uncertainty" : 0.5,
    "uncertainty_src" : "multiple samples from the same batch",
    "method" : "GPC"
}
```

Number average molecular weight  

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the molecular weight                    |
| unit            | string | required | the unit of the provided value                               |
| method          | string | optional | how the value is measured or obtained                        |
| uncertainty     | number | optional | the uncertainty of the provided value. The uncertainty must be provided in the same units as the value provided |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |

**Allowed Units**

- kDa
- Da



## Mw

> Syntax and usage

```json
"Mz" : {
    "value" : 4.4,
    "unit" : "kDa",
    "uncertainty" : 0.5,
    "uncertainty_src" : "multiple samples from the same batch",
    "method" : "GPC"
}
```

Weight average molecular weight  

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the molecular weight                    |
| unit            | string | required | the unit of the provided value                               |
| method          | string | optional | how the value is measured or obtained                        |
| uncertainty     | number | optional | the uncertainty of the provided value. The uncertainty must be provided in the same units as the value provided |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |

**Allowed Units**

- kDa

- Da

  

## Mz

> Syntax and usage

```json
"Mz" : {
    "value" : 4.4,
    "unit" : "kDa",
    "uncertainty" : 0.5,
    "uncertainty_src" : "multiple samples from the same batch",
    "method" : "GPC"
}
```

Z average molecular weight  

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the molecular weight                    |
| unit            | string | required | the unit of the provided value                               |
| method          | string | optional | how the value is measured or obtained                        |
| uncertainty     | number | optional | the uncertainty of the provided value. The uncertainty must be provided in the same units as the value provided |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |

**Allowed Units**

- kDa

- Da

  

## DPn

> Syntax and usage

```json
"DPn" : {
    "value" : 100,
    "uncertainty" : 5,
    "uncertainty_src" : "multiple samples from the same batch",
    "method" : "GPC"
}
```

Number average degree of polymerization of the selected polymeric segment. If multiple blocks are selected, this represent the sum of multiple blocks.

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the degree of polymerization            |
| uncertainty     | number | optional | the uncertainty of the provided value                        |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |
| method          | string | optional | how the value is measured or obtained                        |

<aside class="notice">The end groups and everything not contained within stochastic objects are ignored.</aside>
## DPw

> Syntax and usage

```json
"DPw" : {
    "value" : 100,
    "uncertainty" : 5,
    "uncertainty_src" : "multiple samples from the same batch",
    "method" : "GPC"
}
```

Weight average degree of polymerization of the selected polymeric segment. If multiple blocks are selected, this represent the sum of multiple blocks.

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the degree of polymerization            |
| uncertainty     | number | optional | the uncertainty of the provided value                        |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |
| method          | string | optional | how the value is measured or obtained                        |

<aside class="notice">The end groups and everything not contained within stochastic objects are ignored.</aside>
## DPz

> Syntax and usage

```json
"DPz" : {
    "value" : 100,
    "uncertainty" : 5,
    "uncertainty_src" : "multiple samples from the same batch",
    "method" : "GPC"
}
```

Z average degree of polymerization of the selected polymeric segment. If multiple blocks are selected, this represent the sum of multiple blocks.

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the degree of polymerization            |
| uncertainty     | number | optional | the uncertainty of the provided value                        |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |
| method          | string | optional | how the value is measured or obtained                        |

<aside class="notice">The end groups and everything not contained within stochastic objects are ignored.</aside>
## skewness

> Syntax and usage

```json
"skewness" : {
    "value" : 1,
    "uncertainty" : 0.05,
    "uncertainty_src" : "multiple samples from the same batch",
    "method" : "GPC"
}
```

The skewness of the molecular weight distribution  

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the skewness                            |
| uncertainty     | number | optional | the uncertainty of the provided value                        |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |
| method          | string | optional | how the value is measured or obtained                        |



## kurtosis

> Syntax and usage

```json
"kurtosis" : {
    "value" : 1,
    "uncertainty" : 0.05,
    "uncertainty_src" : "multiple samples from the same batch",
    "method" : "GPC"
}
```

The kurtosis of the molecular weight distribution  

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the kurtosis                            |
| uncertainty     | number | optional | the uncertainty of the provided value                        |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |
| method          | string | optional | how the value is measured or obtained                        |



## MWD

> Syntax and usage

```json
"MWD" : {
    "value" : [0.01,0.01,0.02,...],
    "mol_wt": [1,1.05,1.10,...],
    "unit"  : "kDa",
    "uncertainty" : [0.001,0.001,0.002,...],
    "uncertainty_src" : "GPC uncertainty",
    "method" : "GPC"
}
```

The full molecular weight distribution

**Object Fields**

| Name            | Type            | Option   | Description                                                  |
| --------------- | --------------- | -------- | ------------------------------------------------------------ |
| value           | array of number | required | the relative probability densities at each molecular weight  |
| mol_wt          | array of number | required | the molecular weight with which the values are associated with. length of the value and mol_wt arrays should be identical |
| unit            | string          | required | unit for molecular weight. choice: 'kDa' or 'Da'             |
| method          | string          | optional | how the value is measured or obtained                        |
| uncertainty     | array of number | optional | the uncertainty of each provided value.                      |
| uncertainty_src | string          | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |

**Allowed Units**

- kDa
- Da



## GPC

> Syntax and usage

```json
"GPC" : {
    "I" : [0.01,0.01,0.02,...],
    "t": [1,1.05,1.10,...],
    "unit_t": "m",
    "calib" : "calibration-doc",
    "unit_I": "arbitrary unit",
    "uncertainty" : [0.001,0.001,0.002,...],
    "uncertainty_src" : "GPC-uncertainty",
    "method" : "GPC-spec..."
}
```

The GPC measurement data for polymer molecular weight distribution

**Object Fields**

| Name            | Type            | Option   | Description                                                  |
| --------------- | --------------- | -------- | ------------------------------------------------------------ |
| I               | array of number | required | measured intensities                                         |
| t               | array of number | required | retention times. length of the I and t arrays should be identical |
| unit_t          | string          | required | unit for retention time                                      |
| calib           | string          | required | reference to calibration documentation                       |
| unit_I          | string          | optional | unit for intensity                                           |
| method          | string          | optional | specifications of the GPC                                    |
| uncertainty     | array of number | optional | the uncertainty of each intensity                            |
| uncertainty_src | string          | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |

**Allowed Units for unit_t**

- s (seconds)
- m (minutes)



## p

> Syntax and usage

```json
"p" : {
    "value" : 0.85,
    "method" : "IR quantification of residual unreacted functional groups",
    "uncertainty" : 0.05,
    "uncertainty_src" : "uncertainty in calibration between IR signal and extent of reaction"
}
```

The extent of reaction  

**Object Fields**

| Name            | Type   | Option   | Description                                                  |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| value           | number | required | the numeric value of the extent of reaction                  |
| uncertainty     | number | optional | the uncertainty of the provided value                        |
| uncertainty_src | string | optional | an explanation of what the provided uncertainty reflect and how the number/estimation is obtained |
| method          | string | optional | how the value is measured or obtained                        |

