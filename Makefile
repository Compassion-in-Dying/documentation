
architecture: 
	./tools/make-pdf.sh architecture architecture $(OUTPUT)

architecture-docx: 
	./tools/make-docx.sh architecture architecture $(OUTPUT)

architecture-jira: 
	./tools/make-jira.sh architecture architecture $(OUTPUT)