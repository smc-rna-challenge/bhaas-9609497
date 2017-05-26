baseCommand: [tar, xzvf]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: index_name
  inputBinding: {position: 1}
  type: File
name: tar.cwl
outputs:
- id: output
  outputBinding: {glob: RSEM_build}
  type: Directory
package: file:///home/bhaas/Winterfell_SMC_RNA_DREAM2016/RSEM/cwl/tools/tar.cwl
