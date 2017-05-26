class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': bhaas@synapse.org,
  'foaf:name': bhaas}
doc: 'SMC-RNA challenge isoform quantification submission

  '
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: convert/output, type: File}
steps:
- id: convert
  in:
  - {default: '1,11', id: f}
  - {id: isoforms, source: rsem/output}
  - {default: isoform_quant.tsv, id: output_filename}
  out: [output]
  run: cut.cwl
- id: gunzip1
  in:
  - {id: input, source: TUMOR_FASTQ_1}
  out: [output]
  run: gunzip.cwl
- id: gunzip2
  in:
  - {id: input, source: TUMOR_FASTQ_2}
  out: [output]
  run: gunzip.cwl
- id: rsem
  in:
  - {default: true, id: bowtie2}
  - {default: true, id: calc_pme}
  - {id: fastq1, source: gunzip1/output}
  - {id: fastq2, source: gunzip2/output}
  - {id: index, source: tar/output}
  - {default: rsemOut, id: output_filename}
  - {default: true, id: pairedend}
  - {default: true, id: strandspecific}
  - {default: 8, id: threads}
  - {default: true, id: transcript_length_prior}
  out: [output]
  run: rsem.cwl
- id: tar
  in:
  - {id: index_name, source: index}
  out: [output]
  run: tar.cwl
