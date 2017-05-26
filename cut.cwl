baseCommand: [cut]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: isoforms
  inputBinding: {position: 1}
  type: File
- {id: output_filename, type: string}
- id: f
  inputBinding: {position: 0, prefix: -f}
  type: string
name: cut.cwl
outputs:
- id: output
  outputBinding: {glob: $(inputs.output_filename)}
  type: File
package: file:///home/bhaas/Winterfell_SMC_RNA_DREAM2016/RSEM/cwl/tools/cut.cwl
stdout: $(inputs.output_filename)
