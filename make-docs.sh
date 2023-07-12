#!/bin/bash



tools/make-docx.sh architecture architecture out
tools/make-pdf.sh architecture architecture out

tools/make-docx.sh operations-support operations-support out
tools/make-pdf.sh operations-support operations-support out

tools/make-docx.sh white-labelling white-labelling out
tools/make-pdf.sh white-labelling white-labelling out