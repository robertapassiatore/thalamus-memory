##### Script for path diagrams
library(magrittr)
library(DiagrammeR) 
library(DiagrammeRsvg)
library(tidyverse) 
library(rsvg)
library(xml2)
library(magick)
library(patchwork)

a = DiagrammeR::grViz("                           # All instructions are within a large character string
digraph mediation_l_uniba {    # 'digraph' means 'directional graph', then the graph name 
  
  # graph statement
  #################
  graph [layout = neato,
       overlap = false,
       outputorder = edgesfirst,
       fontsize = 20]
  
  # nodes
  #######
  node [fontname = helvetica, shape = rectangle, style = filled, fillcolor = Lightblue]
  
  # edge
  #######
  
  X [pos = '-3,-0.5!',label = 'X: LFPN\n Medial Subdivision\n Baseline', fillcolor = Linen]
  Y [pos = '5,-0.5!', label = 'Y: Associative Memory\n Index', fillcolor = Linen]
  M1 [pos = '-1,2!', label =  'M1: L BOLD\n Anterior Subdivision\n Encoding']
  M2 [pos = '3,2!', label = 'M2: L BOLD\n Medial Subdivision\n Retrieval']
  caption [pos = '0.8,-1!', label = 'Model fit: TLI=0.60; SRMR=0.072; CFI=0.95']

  # edge definitions with the node IDs
  X->Y [label = '0.16**', color='#c00000', style = bold, fontname = 'helvetica-bold']
  X->M1 [label = '0.16**', style=bold, fontname = 'helvetica-bold']
  X->M2 [label = '0.12*', style=bold, fontname = 'helvetica-bold']
  M1->M2 [label = '-0.09', style=dashed, fontname = 'helvetica']
  M1->Y [xlabel = '-0.24**           ',  style=bold, fontname = 'helvetica-bold', dir = forward]
  M2->Y [xlabel = '0.38***    ', style=bold, fontname = 'helvetica-bold']
  caption [shape = 'plaintext', style='bold', fontname = 'helvetica-bold']
  }")

b = DiagrammeR::grViz("                           # All instructions are within a large character string
digraph mediation_r_uniba {    # 'digraph' means 'directional graph', then the graph name 
  
  # graph statement
  #################
  graph [layout = neato,
       overlap = false,
       outputorder = edgesfirst,
       fontsize = 20]
  
  # nodes
  #######
  node [fontname = helvetica, shape = rectangle, style = filled, fillcolor = Lightblue]
  
  # edge
  #######
  
  X [pos = '-3,-0.5!',label = 'X: RFPN\n Medial Subdivision\n Baseline', fillcolor = Linen]
  Y [pos = '5,-0.5!', label = 'Y: Associative Memory\n Index', fillcolor = Linen]
  M1 [pos = '-1,2!', label =  'M1: R BOLD\n Anterior Subdivision\n Encoding']
  M2 [pos = '3,2!', label = 'M2: R BOLD\n Medial Subdivision\n Retrieval']
  caption [pos = '0.8,-1!', label = 'Model fit: TLI=0.99; SRMR=0.014; CFI=0.99']

  # edge definitions with the node IDs
  X->Y [label = '0.16***', color='#c00000', style = bold, fontname = 'helvetica-bold']
  X->M1 [label = '0.12*', style=bold, fontname = 'helvetica-bold']
  X->M2 [label = '0.10*', style=bold, fontname = 'helvetica-bold']
  M1->M2 [label = '0.02', style=dashed, fontname = 'helvetica']
  M1->Y [xlabel = '-0.27**           ',  style=bold, fontname = 'helvetica-bold', dir = forward]
  M2->Y [xlabel = '0.33***    ', style=bold, fontname = 'helvetica-bold']
  caption [shape = 'plaintext', style='bold', fontname = 'helvetica-bold']
  }")

####RUB

c = DiagrammeR::grViz("                           # All instructions are within a large character string
digraph mediation_l_bochum {    # 'digraph' means 'directional graph', then the graph name 
  
  # graph statement
  #################
  graph [layout = neato,
       overlap = false,
       outputorder = edgesfirst,
       fontsize = 20]
  
  # nodes
  #######
  node [fontname = helvetica, shape = rectangle, style = filled, fillcolor = Lightblue]
  
  # edge
  #######
  
  X [pos = '-3,-0.5!',label = 'X: LFPN\n Medial Subdivision\n Baseline', fillcolor = Linen]
  Y [pos = '5,-0.5!', label = 'Y: Associative Memory\n Index', fillcolor = Linen]
  M1 [pos = '-1,2!', label =  'M1: L BOLD\n Anterior Subdivision\n Encoding']
  M2 [pos = '3,2!', label = 'M2: L BOLD\n Medial Subdivision\n Retrieval']
  caption [pos = '0.8,-1!', label = 'Model fit: TLI=0.60; SRMR=0.09; CFI=0.96']

  # edge definitions with the node IDs
  X->Y [label = '0.09', color='#c00000', style = 'dashed', fontname = 'helvetica']
  X->M1 [label = '0.39**', fontname = 'helvetica-bold']
  X->M2 [label = '0.51**', fontname = 'helvetica-bold']
  M1->M2 [label = '0.16', style=dashed, fontname = 'helvetica']
  M1->Y [xlabel = '-0.45           ',  style=dashed, fontname = 'helvetica', dir = forward]
  M2->Y [xlabel = '0.81**    ', fontname = 'helvetica-bold']
  caption [shape = 'plaintext', style='bold', fontname = 'helvetica-bold']
  }")

d = DiagrammeR::grViz("                           # All instructions are within a large character string
digraph mediation_r_bochum {    # 'digraph' means 'directional graph', then the graph name 
  
  # graph statement
  #################
  graph [layout = neato,
       overlap = false,
       outputorder = edgesfirst,
       fontsize = 20]
  
  # nodes
  #######
  node [fontname = helvetica, shape = rectangle, style = filled, fillcolor = Lightblue]
  
  # edge
  #######
  
  X [pos = '-3,-0.5!',label = 'X: RFPN\n Medial Subdivision\n Baseline', fillcolor = Linen]
  Y [pos = '5,-0.5!', label = 'Y: Associative Memory\n Index', fillcolor = Linen]
  M1 [pos = '-1,2!', label =  'M1: R BOLD\n Anterior Subdivision\n Encoding']
  M2 [pos = '3,2!', label = 'M2: R BOLD\n Medial Subdivision\n Retrieval']
  caption [pos = '0.8,-1!', label = 'Model fit: TLI=0.7; SRMR=0.07; CFI=0.90']

  # edge definitions with the node IDs
  X->Y [label = '0.32', color='#c00000', style = 'dashed', fontname = 'helvetica']
  X->M1 [label = '0.51**', style=bold, fontname = 'helvetica-bold']
  X->M2 [label = '0.51**', style=bold, fontname = 'helvetica-bold']
  M1->M2 [label = '0.34', style=dashed, fontname = 'helvetica']
  M1->Y [xlabel = '-0.63**           ',  style=bold, fontname = 'helvetica-bold', dir = forward]
  M2->Y [xlabel = '0.95**    ', style='bold', fontname = 'helvetica-bold']
  caption [shape = 'plaintext', style='bold', fontname = 'helvetica-bold']
  }")


a = DiagrammeRsvg::export_svg(a)
a = charToRaw(a) # flatten
rsvg::rsvg_svg(a, "path_l_uniba.svg") # saved graph as svg in current working directory
rsvg::rsvg_pdf(a, "path_l_uniba.pdf") # saved graph as pdf in current working directory

b = DiagrammeRsvg::export_svg(b)
b = charToRaw(b) # flatten
rsvg::rsvg_svg(b, "path_r_uniba.svg") # saved graph as svg in current working directory
rsvg::rsvg_pdf(b, "path_r_uniba.pdf") # saved graph as pdf in current working directory


c = DiagrammeRsvg::export_svg(c)
c = charToRaw(c) # flatten
rsvg::rsvg_svg(c, "path_l_rub.svg") # saved graph as svg in current working directory
rsvg::rsvg_pdf(c, "path_l_rub.pdf") # saved graph as pdf in current working directory

d = DiagrammeRsvg::export_svg(d)
d = charToRaw(d) # flatten
rsvg::rsvg_svg(d, "path_r_rub.svg") # saved graph as svg in current working directory
rsvg::rsvg_pdf(d, "path_r_rub.pdf") # saved graph as pdf in current working directory


  
  
  
  
  