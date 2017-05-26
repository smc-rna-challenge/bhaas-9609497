arguments:
- {position: 3, valueFrom: $(inputs.index.path + "/Homo_sapiens.GRCh37.75.gtf.inPrimary.gtf.cdna")}
baseCommand: [rsem-calculate-expression]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- {id: index, type: Directory}
- id: fastq1
  inputBinding: {position: 2}
  type: File
- id: fastq2
  inputBinding: {position: 2}
  type: File
- id: pairedend
  inputBinding: {position: 0, prefix: --paired-end}
  type: ['null', boolean]
- id: strandspecific
  inputBinding: {position: 0, prefix: --strand-specific}
  type: ['null', boolean]
- id: rspd
  inputBinding: {position: 0, prefix: --estimate-rspd}
  type: ['null', boolean]
- id: correct_GC_bias
  inputBinding: {position: 0, prefix: --correct-GC-bias}
  type: ['null', boolean]
- id: correct_GC_bias_quantile
  inputBinding: {position: 0, prefix: --correct-GC-bias-quantile}
  type: ['null', boolean]
- id: calc_pme
  inputBinding: {position: 0, prefix: --calc-pme}
  type: ['null', boolean]
- id: transcript_length_prior
  inputBinding: {position: 0, prefix: --transcript-length-prior}
  type: ['null', boolean]
- id: bowtie2
  inputBinding: {position: 0, prefix: --bowtie2}
  type: ['null', boolean]
- id: threads
  inputBinding: {position: 1, prefix: -p}
  type: ['null', int]
- id: output_filename
  inputBinding: {position: 4}
  type: string
name: rsem.cwl
outputs:
- id: output
  outputBinding: {glob: $(inputs.output_filename + '.isoforms.results')}
  type: File
package: file:///home/bhaas/Winterfell_SMC_RNA_DREAM2016/RSEM/cwl/tools/rsem.cwl
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: 'winterfelldream2016/expressionpipe:rsem_beta_v3'}
- {class: ResourceRequirement, coresMin: 8, ramMin: 80000}
