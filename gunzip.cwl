baseCommand: [gunzip, -c]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: input
  inputBinding: {position: 0}
  type: File
name: gunzip.cwl
outputs:
- id: output
  outputBinding: {glob: '$(inputs.input.path.split("/").slice(-1)[0].split(".").slice(0,-1).join("."))'}
  type: File
package: file:///home/bhaas/Winterfell_SMC_RNA_DREAM2016/RSEM/cwl/tools/gunzip.cwl
requirements:
- {class: InlineJavascriptRequirement}
stdout: $(inputs.input.path.split("/").slice(-1)[0].split(".").slice(0,-1).join("."))
