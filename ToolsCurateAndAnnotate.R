########################################################################
# Digital Health Portal
# Purpose: To Add Tools to the DH Project
# Author: Solveig Sieberts
# email: sieberts@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to the Digital Health Portal Backend (syn21574434)
#  Tools live in folder syn22012702
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
# Current version creates a synapse endity for mobileHeathTools and annotates
#
#

##############
# Required libraries
##############

library(synapser)
synLogin()

pid<-'syn22012702'

tools.list = list(
  ## mhealthtools
  'mhealthtools' = list(consortium = 'mHealth',
                       softwareName = 'mhealthtools',
                       url = 'https://github.com/Sage-Bionetworks/mhealthtools',
                       softwareAuthor = c('Phil Snyder', 'Meghasyam Tummalacherla', 'Thanneer Perumal', 'Abhishek Pratap', 'Elias Chaibub Neto'),
                       softwareType = 'packageLibrary',
                       softwareLanguage = 'R',
                       softwareRepository = 'GitHub',
                       inputDataType = c('accelerometer', 'gyroscope', 'camera', 'touchscreen'),
                       outputDataType = c('sensor features', 'heart rate', 'activity features'),
                       summary = 'An R package for extracting features from mobile and wearable sensor data',
                       digitalAssessmentCategory = c('resting tremor', 'postural tremor', 'active tremor', 'gait', 'heart rate'),
                       dhPortalIndex = 'TRUE')
)
                       
##############
# Create Entity and set Annotations in Synapse
##############  
# Update annotations
toolname.list <- names(tools.list) 
for(toolname in tools.list){
  
  tool_entity = File(path=tools.list[[toolname]]$url, name=tools.list[[toolname]]$softwareName, parent=pid, synapseStore=F)
  tool_entity = synStore(tool_entity, forceVersion=F)
  
  #### Uncomment this before updating for real
   synSetAnnotations(tool_entity$properties$id, annotations = tools.list[[toolname]])
  ####
  
  print(proj.id)
  print(projects.annotations[[proj.id]])
}



