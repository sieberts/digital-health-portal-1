########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in ElevateMS Public Researcher Portal
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn21140362
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
##

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synLogin()

study = 'elevateMS Study'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = TRUE, repeated = TRUE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
tables.annotations = list(
  # Voice-based Digital Symbol Substitution Test
  'syn22007628' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(302), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('microphone'),
                       devicePlatform = c('iOS', 'Android'), 
                       deviceLocation = c('flat surface', 'hand'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       digitalAssessmentCategory= c('phonation', 'cognition'),
                       digitalAssessmentDetails = c('visual/digit symbol substitution task(vsst/dsst)'),
                       dataType=c('clinical'), #or sensor??
                       dataSubtype=c('processed', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602268',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Triggers Survey
  'syn22007590' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(372), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602269',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Symptoms Survey
  'syn22006791' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(409), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602277',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Truncated MSIS-29
  'syn22007602' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(181), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602278',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Tapping
  'syn22006967' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(450), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('touchscreen'),
                       devicePlatform = c('iOS','Android'), 
                       deviceLocation = c('flat surface'),
                       diagnosis= c('multiple sclerosis', 'control'),
                       reportedOutcome = c('dyskinesia', 'bradykinesia'),
                       digitalAssessmentCategory= c('motor coordination'),
                       digitalAssessmentDetails = c('tapping'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw','metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602279',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Walking
  'syn22007736' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(272), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                       devicePlatform = c('iOS', 'Android'), 
                       deviceLocation = c('hand', 'pocket'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       reportedOutcome = c('dyskinesia', 'bradykinesia', 'freezing of gait'),
                       digitalAssessmentCategory= c('gait'),
                       digitalAssessmentDetails = c('walking (flat)', 'standing'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602280',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Passive Pedometer Data
  'syn22006457' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(261), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                       devicePlatform = c('iOS', 'Android'), 
                       deviceLocation = c('pocket'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       reportedOutcome = c('step count', 'distance'),
                       digitalAssessmentCategory= c('gait'),
                       digitalAssessmentDetails = c('walking (flat)', 'standing'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602281',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Tremor 
  'syn22007482' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(395), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                       devicePlatform = c('iOS', 'Android'), 
                       deviceLocation = c('hand', 'pocket'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       reportedOutcome = c('dyskinesia', 'bradykinesia', 'freezing of gait'),
                       digitalAssessmentCategory= c( 'postural tremor', 'action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose', 'alternating hand movements'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602282',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Baseline Characteristics
  'syn22006146' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(524), 
                       # dataCollectionMethod= c(''),
                       # deviceType = c(''),
                       # sensorType = '',
                       # devicePlatform = c(''), 
                       # deviceLocation = c(''),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # digitalAssessmentCategory= c(''),
                       # digitalAssessmentDetails = c(''),
                       # dataType=c(''),
                       # dataSubtype=c(''),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602283',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # NeuroQoL-Lower Extremity
  'syn22006206' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(106), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602285',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # NeuroQoL-Upper Extremity
  'syn22006217' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(156), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602286',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),

  # NeuroQoL-Cognition
  'syn22006201' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(117), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602287',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Passive Weather Data
  'syn22007631' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(273), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602288',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # WPAI
  'syn22007636' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(171), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602289',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Medication Survey
  'syn22006180' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(182), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602290',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Relapses Survey
  'syn22006741' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(52), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602292',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Daily Check-In
  'syn22006159' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(414), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'), 
                       # reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       # metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602298',
                       dataAccessInstructions = 'syn21140362/wiki/602266')

)

#################
# Now set annotations
#################
projects.list =  names(tables.annotations)
for(proj.id in projects.list){

  #### Uncomment this before updating for real
  # synSetAnnotations(proj.id, annotations = tables.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(tables.annotations[[proj.id]])
}


##################
# Set annotations of individual files
##################
## Place Holder, since there aren't any individual files at the moment
