# List of common BigSMILES repeat units 
This document holds a list of common repeat units and their equivalent SMILES string replacements that could be directly used within BigSMILES without additional explicit definition.

To contribute to the list, please submit a pull request. The modifications will be accepted after review.

## BigSMILES Fragment Naming Syntax
1. The names of the fragments should consist of ASCII symbols enclosed between a pair of square brackets.
2. Whitespace characters and square brackets should be avoided within the name to prevent conflict with the bracket surrounding the name. 
3. The names are not case sensitive. 
4. SMILES strings for the repeat units need not conform to Canonical SMILES syntax; however, as they are molecular fragments to be embedded within BigSMILES strings, direct concatenation of the repeat units should yield valid oligomer structures.  
For example, propylene repeat unit can either be written as CC(C) or C(C)C but not CCC, because direct concatenation of CCC would yield  

   >...-CCC-CCC-CCC-...  
   
   which is not polyproplyene.  
   For SMILES syntax, please refer to the [Daylight Chemical Information System documentation](https://www.daylight.com/dayhtml/doc/theory/theory.smiles.html)

5. In general, the repeat units are written in their canonical orientation; e.g. vinyl repeat units are written as CC(R).

## Common repeat units and their equivalent string replacements 

\[#Ethylene\]  
CC

\[#Propylene\]  
CC(C)

\[#EthyleneGlycol\]  
CCO

\[#cis-1,4-Isoprene\]  
C\\C=C(C)/C

\[#trans-1,4-Isoprene\]  
C/C=C(C)/C

\[#3,4-Isoprene\]  
CC(C(C)=C)

\[#Styrene\]  
CC(c1ccccc1)

\[#VinylAlcohol\]  
CC(O)

\[#VinylAcetate\]  
CC(OC(=O)C)

\[#LacticAcid\]  
OC(C)C(=O)

\[#Nylon-6,6\]  
C(=O)CCCCC(=O)NCCCCCCN

\[#1,4-Butadiene\]  
CC=CC

\[#cis-1,4-Butadiene\]  
C\\C=C/C

\[#trans-1,4-Butadiene\]  
C/C=C/C

\[#Chloroprene\]  
CC(Cl)=CC

\[#VinylChloride\]  
CC(Cl)

\[#Tetrafluoroethylene\]  
C(F)(F)C(F)(F)

\[#VinylideneFluoride\]  
CC(F)(F)

\[#MethylMethacrylate\]  
CC(C)(C(=O)OC)

\[#MethylAcrylate\]  
CC(C(=O)OC)

\[#MethacrylicAcid\]  
CC(C)(C(=O)O)

\[#AcrylicAcid\]  
CC(C(=O)O)

\[#Methacrylate\]  
CC(C)(C(=O)\[O-\])

\[#Acrylate\]  
CC(C(=O)\[O-\])

\[#ButylAcrylate\]  
CC(C(=O)OCCCC)

\[#EthylAcrylate\]  
CC(C(=O)OCC)

\[#2-EthylhexylAcrylate\]  
CC(C(=O)OCC(CC)CCCC)

\[#Acrylamide\]  
CC(C(=O)N)

\[#Acrylonitrile\]  
CC(C#N)

\[#N-Isopropylacrylamide\]  
CC(C(=O)NC(C)C)

\[#Dimethylacrylamide\]  
CC(C(=O)N(C)C)

\[#4-Chlorostyrene\]  
CC(c1ccc(Cl)cc1)

\[#2-Chlorostyrene\]  
CC(c1c(Cl)cccc1)

\[#4-Chloromethylstyrene\]  
CC(c1ccc(CCl)cc1)

\[#4-StyrenesulfonicAcid\]  
CC(c1ccc(S(=O)(=O)O)cc1)

\[#StyreneSulfonate\]  
CC(c1ccc(S(=O)(=O)\[O-\])cc1)

\[#4-Vinylpyridine\]  
CC(c1ccncc1)

\[#2-Vinylpyridine\]  
CC(c1ncccc1)

\[#PropyleneGlycol\]  
CC(C)O

\[#GlycolicAcid\]  
OCC(=O)

\[#TerephthalicAcid\]  
C(=O)c(cc1)ccc1C(=O)

\[#e-Caprolactaone\] (ε-Caprolactaone)  
OCCCCCC(=O)

\[#e-Caprolactam\] (ε-Caprolactam)  
NCCCCCC(=O)

\[#(R)-3-Hydroxybutyrate\]  
O\[C@H\](C)CC(=O)

\[#Alanine\], \[#Ala\]  
N\[C@@H\](C)C(=O)

\[#Arginine\], \[#Arg\]  
N\[C@@H\](CCCNC(=N)N)C(=O)

\[#Asparagine\], \[#Asn\]  
N\[C@@H\](CC(=O)N)C(=O)

\[#AsparticAcid\], \[#Asp\]  
N\[C@@H\](CC(=O)O)C(=O)

\[#Cysteine\], \[#Cys\]  
N\[C@@H\](CS)C(=O)

\[#Glutamine\], \[#Gln\]  
N\[C@@H\](CCC(=O)N)C(=O)

\[#GlutamicAcid\], \[#Glu\]  
N\[C@@H\](CCC(=O)O)C(=O)

\[#Glycine\], \[#Gly\]  
NCC(=O)

\[#Histidine\], \[#His\]  
N\[C@@H\](Cc1ncnc1)C(=O)

\[#Isoleucine\], \[#Ile\]  
N\[C@@H\](\[C@@H\]  (C)CC)C(=O)

\[#Leucine\], \[#Leu\]  
N\[C@@H\](CC(C)C)C(=O)

\[#Lysine\], \[#Lys\]  
N\[C@@H\](CCCCN)C(=O)

\[#Methionine\], \[#Met\]  
N\[C@@H\](CCSC)C(=O)

\[#Phenylalanine\], \[#Phe\]  
N\[C@@H\](Cc1ccccc1)C(=O)

\[#Proline\], \[#Pro\]  
N1\[C@@H\](CCC1)C(=O)

\[#Serine\], \[#Ser\]  
N\[C@@H\](CO)C(=O)

\[#Threonine\], \[#Thr\]  
N\[C@@H\](\[C@H\](O)C)C(=O)

\[#Tryptophan\], \[#Trp\]  
N\[C@@H\](Cc1cnc2c1cccc2)C(=O)

\[#Tyrosine\], \[#Tyr\]  
N\[C@@H\](Cc1ccc(O)cc1)C(=O)

\[#Valine\], \[#Val\]  
N\[C@@H\](C(C)C)C(=O)

\[#DeoxyadenosineMonophosphate\]  
P(=O)(O)OC\[C@H\]1O\[C@@H\](N1C=NC2=C1N=CNC2N)C\[C@@H\]1O

\[#DeoxycytidineMonophosphate\]  
P(=O)(O)OC\[C@H\]1O\[C@@H\](N1C=CC(N)=NC1=O)C\[C@@H\]1O

\[#DeoxyguanosineMonophosphate\]  
P(=O)(O)OC\[C@H\]1O\[C@@H\](N1C=NC2=C1N=C(N)NC2=O)C\[C@@H\]1O

\[#DeoxythymidineMonophosphate\]  
P(=O)(O)OC\[C@H\]1O\[C@@H\](N1C=C(C)C(=O)NC1=O)C\[C@@H\]1O

\[#AdenosineMonophosphate\]  
P(=O)(O)OC\[C@H\]1O\[C@@H\](N1C=NC2=C1N=CNC2N)\[C@H\](O)\[C@@H\]1O

\[#CytidineMonophosphate\]  
P(=O)(O)OC\[C@H\]1O\[C@@H\](N1C=CC(N)=NC1=O)\[C@H\](O)\[C@@H\]1O

\[#GuanosineMonophosphate\]  
P(=O)(O)OC\[C@H\]1O\[C@@H\](N1C=NC2=C1N=C(N)NC2=O)\[C@H\](O)\[C@@H\]1O

\[#UridineMonophosphate\]  
P(=O)(O)OC\[C@H\]1O\[C@@H\](N1C=CC(=O)NC1=O)\[C@H\](O)\[C@@H\]1O

\[#α-D-glucose\] (Amylose)  
O\[C@H\]1\[C@@H\](CO)O\[C@@H\](\[C@H\](O)\[C@H\]1O)

\[#N-acetylglucosamine\] (Chitin)   
O\[C@@H\]1\[C@@H\](CO)O\[C@H\](\[C@H\](NC(=O)C)\[C@H\]1O)O\[C@H\]2\[C@H\](O)\[C@@H\](NC(=O)C)\[C@@H\](O\[C@@H\]2CO)

\[#D-glucuronicAcid-co-N-acetyl-D-glucosamine\] (Hyaluronic acid)   
O\[C@@H\]1\[C@@H\](C(=O)O)O\[C@H\](\[C@H\](O)\[C@H\]1O)\[C@H\]2\[C@H\](O)\[C@@H\](CO)O\[C@H\](\[C@@H\]2NC(=O)C)

\[#p-Phenylene\]  
c1ccc(cc1)

\[#p-Xylyene\]  
Cc1ccc(cc1)C

\[#m-Xylyene\]  
Cc1ccccc(c1)C

\[#Thiophene\]  
C(S1)=CC=C1

\[#p-PhenyleneVinylene\]  
c(cc1)ccc1C=C

\[#3,4-Ethylenedioxythiophene\]  
C(S1)=C2OCCOC2=C1

\[#Pyrrole\]  
C(N1)=CC=C1

\[#p-PhenyleneSulfide\]  
c(cc1)ccc1S

\[#Actylene\]  
C=C

\[#Leucoemeraldine\]  
c(cc1)ccc1N

\[#Pernigraniline\]  
c(cc1)ccc1N=C(C=C2)C=CC2=N

