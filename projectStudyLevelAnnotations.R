########################################################################
# Digital Health Portal
# Purpose: To Annotate the Digital Health Studies
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to all the following
# mhealth studies
## Not considering gravity as a sensor, as it is a derived measures
## All studies have a template annotation list assigned. Any annotation classes 
# from that list can be edited/removed. Any new annotation class will be added
# to the overall template of all relevant studies. Projects have a slightly different
# template, which is detailed in projectProjectLevelAnnoations.R

### To-Dos(continous update):
## Keep the Excel sheet of all metadata possibilities for each metadata type
# For eg., sensor - accelerometer, PPG, gyroscope, camera, touchscreen etc.,

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
library(githubr)
synLogin()

##############
# List of projects and related annotations
##############
# Project Synapse ID vs annotations needed
projects.annotations <- list(
  
  ## mPower 1.0
  'syn4993293' = list(consortium = 'mHealth',
                      collectionType = 'Observational Study',
                      study = 'mPower Mobile Parkinson Disease Study',
                      numberParticipants= as.integer(8320), # number who opted to share broadly
                      dataCollectionMethod= c('active', 'patient reported outcome',
                                              'clinical assessment'),
                      deviceType = c('handheld'),
                      sensorType = c('touchscreen', 'accelerometer', 'microphone',
                                     'gyroscope', 'magnetometer'),
                      devicePlatform = c('iOS'),
                      deviceLocation = c('hand', 'pocket', 'flat surface'),
                      diagnosis=  c("Parkinson's Disease", 'control'),
                      reportedOutcome = c('medication report', 'PDQ-8', 'MDS-UPDRS',
                                          'demographics survey'),
                      digitalAssessmentCategory= c('phonation', 'gait',
                                                   'motor coordination', 'cognition'),
                      digitalAssessmentDetails = c('walking (flat)', 'standing',
                                                   'phonation', 'tapping',
                                                   'matching tiles'),
                      sensorDataType = c('raw', 'processed'),
                      investigator= c('Sage Bionetworks'),
                      resourceType = 'curatedData',
                      # intervention = '',
                      keywords = c('neurodegeneration', 'neurology', "Parkinson's"),
                      dhPortalIndex = 'TRUE', # Change after filling annotations
                      studyDescriptionLocation = 'syn4993293',
                      studyDataDescriptionLocation = 'syn4993293/wiki/247861',
                      studyDescription = 'mPower is a large, longitudinal study which piloted new approaches to monitoring key indicators of Parkinson Disease progression and diagnosis incorporating traditional behavioral symptom measurements along with novel metrics gleaned from sensor-rich mobile devices.',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),

  ## MoleMapper Public Researcher Portal
  'syn5576734' = list(consortium = 'mHealth',
                      collectionType = 'Observational Study',
                      study = 'Mole Mapper Study',
                      numberParticipants= as.integer(1920),
                      dataCollectionMethod= c('active', 'patient reported outcome'),
                      deviceType = c('handheld'),
                      sensorType = c('touchscreen', 'camera'),
                      devicePlatform = c('iOS', 'Android'),
                      deviceLocation = c('hand'),
                      diagnosis=  c('melanoma', 'control'),
                      reportedOutcome =c('mole diameter', 'mole location'),
                      digitalAssessmentCategory= c('dermatologic phenotype'),
                      digitalAssessmentDetails = c('photograph'),
                      sensorDataType = 'raw',
                      investigator= c('Sancy Leachman'),
                      resourceType = 'experimentalData',
                      # intervention = '',
                      keywords = c("dermatology", "skin", "neoplasm", "mole",
                                   "epidermis", "cancer", "lesion", "melanoma",  "nevus" ),
                      dhPortalIndex = 'TRUE', # Change after filling annotations
                      studyDescriptionLocation = 'syn5576734',
                      studyDataDescriptionLocation = 'syn5576734/wiki/406009',
                      studyDescription = 'MoleMapper is an iPhone based study to track and document mole abnormalities that may signal a progression towards melanoma.',
                      dataAccessInstructions = 'syn5576734/wiki/391119'),

  ## Asthma Health Public Researcher Portal
  'syn8361748' = list(consortium = 'mHealth',
                      collectionType = 'Observational Study',
                      study = 'Asthma Mobile Health Study',
                      numberParticipants= as.integer(5875),
                      dataCollectionMethod= c('patient reported outcome'),
                      deviceType = c('handheld'),
                      sensorType = c('touchscreen'),
                      devicePlatform = c('iOS'),
                      deviceLocation = c('hand'),
                      diagnosis=  c('asthma'),
                      reportedOutcome =c('ZIP code','demographics survey','medication report',
                                         'EQ-5D', 'medical history', 'asthma symptoms',
                                         'asthma triggers', 'asthma management'),
                      digitalAssessmentCategory= c('respiratory'),
                      digitalAssessmentDetails = c('survey'),
                      # sensorDataType = 'processed',
                      investigator= c('Yu-Feng Yvonne Chan'),
                      resourceType = 'experimentalData',
                      # intervention = '',
                      keywords = c('asthma', 'lung disease'),
                      dhPortalIndex = 'TRUE',
                      studyDescriptionLocation = 'syn8361748',
                      studyDataDescriptionLocation = 'syn8361748/wiki/415365',
                      studyDescription = 'The Asthma Health Study was an iPhone-based observational study to understand symptom triggers through the collection of symptom and medication surveys, along with passive geolocation, weather, and air quality monitoring.',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),

  ## elevateMS
  'syn21140362' = list(consortium = 'mHealth',
                       collectionType = 'Observational Study',
                       study = 'elevateMS Study',
                       numberParticipants= as.integer(540),
                       dataCollectionMethod= c('active', 'passive', 'patient reported outcome'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope',
                                      'magnetometer', 'touchscreen', 'microphone'),
                       devicePlatform = c('iOS', 'Android'),
                       deviceLocation = c('hand', 'pocket', 'flat surface'),
                       diagnosis=  c('multiple sclerosis', 'control'),
                       reportedOutcome =c('dyskinesia', 'bradykinesia','step count', 'distance',
                                          'freezing of gait', 'medication report', 'symptoms report',
                                          'triggers report', 'relapses report', 'NeuroQOL-Cognition',
                                          'NeuroQOL-LowerExtremity', 'NeuroQOL-UpperExtremity'),
                       digitalAssessmentCategory= c('postural tremor', 'gait', 'motor coordination',
                                                    'cognition', 'quality of life','phonation',
                                                    'action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)',
                                                    'standing', 'tapping', 'alternating hand movements',
                                                    'visual/digit symbol substitution task(vsst/dsst)'),
                       sensorDataType = c('raw', 'processed'),
                       investigator= c('Sage Bionetworks' , 'Novartis Pharmaceuticals Corporation'),
                       resourceType = c('curatedData'),
                       # intervention = '',
                       keywords = c('neurodegenerative disorders'),
                       dhPortalIndex = 'TRUE', # Change after filling annotations
                       studyDescriptionLocation = 'syn21140362',
                       studyDataDescriptionLocation = 'syn21140362/wiki/602267',
                       studyDescription = 'elevateMS was a smartphone-based study designed to monitor and understand the variations in symptoms and triggers in multiple sclerosis (MS), through surveys, passive data collection, and physical and cognitive assessments.',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),



  ## Heart Snapshot
  'syn22107959' = list(consortium = 'mHealth',
                       collectionType = 'Validation Study',
                       study = 'Heart Snapshot Study',
                       numberParticipants= as.integer(124),
                       dataCollectionMethod= c('active', 'passive', 'patient reported outcome'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType =  c('accelerometer', 'gyroscope',
                                       'oximeter', 'camera', 'spectrocolorimeter',
                                       'photosensor'),
                       devicePlatform = c('iOS', 'Android', 'Fitbit', 'Pantone', 'Windows'),
                       deviceLocation = c('hand', 'pocket', 'finger', 'wrist', 'face'),
                       diagnosis=  c('control'),
                       reportedOutcome =c('vo2max', 'resting heart rate'),
                       digitalAssessmentCategory= c('cardiorespiratory fitness',
                                                    'cardiovascular',
                                                    'skin color', 'physical activity'),
                       digitalAssessmentDetails = c('12-min run test', 'facial skin color',
                                                    'finger skin color', 'heart rate',
                                                    'daily physical activity',
                                                    'treadmill stresstest',
                                                    'tecumseh test'),
                       sensorDataType = c('raw', 'processed'),
                       investigator= c('Scripps Translational Sciences Institute', 'Sage Bionetworks'),
                       resourceType = 'curatedData',
                       # intervention = '',
                       keywords = c('cardiorespiratory fitness', 'physical activity',
                                    'heart rate'),
                       dhPortalIndex = 'TRUE', # Change after filling annotations
                       studyDescriptionLocation = 'syn22107959',
                       studyDataDescriptionLocation = 'syn22107959/wiki/605543',
                       studyDescription = 'Heart Snapshot is a validation study for smartphone based measurement of VO2 max in clinical and real world settings',
                       dataAccessInstructions = 'syn22107959/wiki/605542'),

  ## MyHeart Counts Public Researcher Portal
  'syn11269541' = list(consortium = 'mHealth',
                       collectionType = 'Observational Study',
                       study = 'MyHeart Counts Cardiovascular Health Study',
                       numberParticipants= as.integer(26902),
                       dataCollectionMethod= c('active' , 'passive', 'patient reported outcome'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope',
                                      'magnetometer', 'pedometer', 'gps'),
                       devicePlatform = c('iOS'),
                       deviceLocation = c('hand' , 'pocket', 'wrist'),
                       diagnosis=  c('control'),
                       reportedOutcome =c('inclusion survey', 'PAR-Q', 'diet survey',
                                          'sleep report', 'physical activity',
                                          'medical history', 'demographics survey',
                                          'quality of life', 'disease risk', 'heart age',
                                          "blood pressure", "fasting glucose",
                                          "cholesterol", "diabetes", "hypertension"),
                       digitalAssessmentCategory= c('gait', 'physical activity', 'sleep'),
                       digitalAssessmentDetails = c('6-min walk test'),
                       sensorDataType = c('raw', 'processed'),
                       investigator= c('Stanford Medicine'),
                       resourceType = 'experimentalData',
                       # intervention = '',
                       keywords = c('cardiovascular health', 'physical activity'),
                       dhPortalIndex = 'TRUE', # Change after filling annotations
                       studyDescriptionLocation = 'syn11269541',
                       studyDataDescriptionLocation = 'syn11269541/wiki/485635',
                       studyDescription = 'The MyHeart Counts Cardiovascular Health Study is a smartphone-based study of cardiovascular health, consisting of records of daily physical activity, health questionnaires, and 6-minute walk fitness tests.',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),


  ## MJFF Levodopa Response Study
  'syn20681023' = list(consortium = 'mHealth',
                       collectionType = 'Interventional Study',
                       study = 'MJFF Levodopa Response Study',
                       numberParticipants= as.integer(29),
                       dataCollectionMethod= c('active', 'passive', 'patient reported outcome',
                                               'clinical assessment'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('Shimmer', 'GENEActiv', 'Android', 'Pebble OS'),
                       deviceLocation = c('wrist', 'waist', 'forearm', 'shank', 'back'),
                       diagnosis= "Parkinson's disease",
                       reportedOutcome =c('MDS-UPDRS', 'tremor', 'dyskinesia', 'bradykinesia',
                                          'freezing of gait', 'medication report', 'sleep report',
                                          'feedback survey'),
                       digitalAssessmentCategory= c('resting tremor', 'action tremor', 'gait',
                                                    'postural tremor'),
                       digitalAssessmentDetails = c('walking (flat)', 'walking (stairs)',
                                                    'standing', 'sitting', 'finger-to-nose',
                                                    'alternating hand movements', 'drawing',
                                                    'typing', 'opening a water bottle and pouring',
                                                    'arranging paper','assembling nuts and bolts',
                                                    'folding towels'),
                       # standing, walking in a straight line for 30s, walking in a straight line for 30s while counting backwards,
                       # walking upstairs, walking down stairs, walking through a narrow corridor, finger-to-nose for 15s (twice with each arm),
                       # alternating hand movements for 15s (twice with each arm), drawing, typing on a keyboard for 30s,
                       # opening a bottle and pouring water (three times), arranging sheets of paper in a folder (twice),
                       # assembling nuts and bolts for 30s, folding a towel three times, and sitting
                       sensorDataType = 'raw',
                       investigator= c('Michael J. Fox Foundation', 'Bonato'),
                       resourceType = 'experimentalData',
                       intervention = 'levodopa',
                       keywords = c('neurodegeneration', 'neurology', "Parkinson's"),
                       dhPortalIndex = 'TRUE',
                       studyDescriptionLocation = 'syn20681023',
                       studyDataDescriptionLocation = 'syn20681023/wiki/594680',
                       studyDescription = 'The purpose of the study was to understand the feasibility of at-home monitoring of PD symptoms and motor fluctuations, and subjects were monitored both in-clinic, while performing a battery of standard activities, and at home while performing their daily activities.',
                       dataAccessInstructions = 'syn20681023/wiki/594679'),

  ## BRIGHTEN Study
  'syn10848316' = list(consortium = 'mHealth',
                       collectionType = 'Observational Study',
                       study = 'Brighten Study',
                       numberParticipants= as.integer(2258),
                       dataCollectionMethod= c('patient reported outcome'),
                       deviceType = c('handheld'),
                       sensorType = c('touchscreen'),
                       devicePlatform = c('iOS', 'Android'),
                       deviceLocation = c('hand'),
                       diagnosis=  c('control'),
                       reportedOutcome =c('PHQ-9', 'PHQ-2', 'Sheehan Disability Scale (SDS)', 'GAD-7',
                                          'sleep report', 'AUDIT-C', 'phone usage', 'mood', 'demographics survey',
                                          'physical activity'),
                       digitalAssessmentCategory= c('cognition', 'sleep', 'mood',
                                                    'mobility', 'mental health'),
                       # digitalAssessmentDetails = c(''),
                       # sensorDataType = 'raw',
                       investigator= c('UW', 'UCSF'),
                       resourceType = c('curatedData'),
                       # intervention = '',
                       keywords = c('psychiatry', 'psychology', 'mental health', 'depression'),
                       dhPortalIndex = 'TRUE',
                       studyDescriptionLocation = 'syn10848316',
                       studyDataDescriptionLocation = 'syn10848316/wiki/548728',
                       studyDescription = 'The Brighten studies(V1 and V2), funded by the National Institute for Mental Health, were designed to tests a new and possibly easier way for individuals to track & manage their depression symptoms.',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),

  ## SleepHealth Public Researcher Portal
  'syn18492837' = list(consortium = 'mHealth',
                       collectionType = 'Observational Study',
                       study = 'SleepHealth Mobile App Study ',
                       numberParticipants= as.integer(7250),
                       dataCollectionMethod= c('patient reported outcome', 'active', 'passive'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('touchscreen', 'pedometer', 'gyroscope', 'accelerometer'),
                       devicePlatform = c('iOS'),
                       deviceLocation = c('hand', 'wrist', 'pocket'),
                       diagnosis=  c('control'),
                       reportedOutcome =c('sleep report',
                                          'activity report', 'medical history',
                                          'quality of life', 'demographics survey',
                                          'research interest', 'family history',
                                          'height', 'weight'),
                       digitalAssessmentCategory= c('physical activity', 'cardiovascular',
                                                    'cognition'),
                       digitalAssessmentDetails = c('daily physical activity', 'heart rate',
                                                    '3-minute Psychomotor Vigilance Task (PVT-B)',
                                                    'tapping', 'step count', 'heart rate',
                                                    'flights climbed', 'distance',
                                                    'resting energy burned',
                                                    'exercise time', 'active energy burned'),
                       sensorDataType = 'processed',
                       investigator= c('American Sleep Apnea Association', 'UCSD'),
                       resourceType = c('curatedData'),
                       # intervention = '',
                       keywords = c('sleep'),
                       dhPortalIndex = 'TRUE',
                       studyDescriptionLocation = 'syn18492837',
                       studyDataDescriptionLocation = 'syn18492837/wiki/590797',
                       studyDescription = 'The SleepHealth Mobile App Study was created to investigate how sleep is associated with general health, daytime alertness, medical conditions, and productivity.',
                       dataAccessInstructions = 'syn18492837/wiki/590794'),


  ## MindKind Study
  'syn26067631' = list(consortium = 'mHealth',
                       collectionType = 'Observational Study',
                       study = 'MindKind Study',
                       numberParticipants= as.integer(6739),
                       dataCollectionMethod= c('active', 'patient reported outcome'),
                       deviceType = c('handheld'),
                       sensorType = c('touchscreen'),
                       devicePlatform = c('Android'),
                       deviceLocation = c('hand'),
                       diagnosis=  c('control'),
                       reportedOutcome =c("demographics survey", "USDA Food insecurity survey",
                          "PhenX Neighborhood Safety survey", "PhenX Neighborhood Collective Efficacy survey",
                          "exposure to violence survey", "habits survey", "physical activity",
                          "phone usage", "WHODAS", "PHQ-9", "GAD-7", "mental health history",
                          "mood", "International Physical Activity Questionnaire",
                          "activity report","Behavioural Activation for Depression Scale (BADS)",
                          "sleep report", "Insomnia Severity Index", "UCLA Loneliness Scale",
                          "feedback survey","informed consent", "data governance preferences" ),
                       digitalAssessmentCategory= c('sleep', 'mood', 'participant engagement',
                                                    'physical activity', 'mental health',
                                                    "social activity", "positive activities"),
                       # digitalAssessmentDetails = c(''),
                       # sensorDataType = 'raw',
                       investigator= c('MindKind Consortium'),
                       resourceType = c('curatedData'),
                       # intervention = '',
                       keywords = c('psychology', 'mental health', 'depression', 'anxiety',
                                    'lived experience', 'active ingredients'),
                       dhPortalIndex = 'TRUE',
                       studyDescriptionLocation = 'syn26067631',
                       studyDataDescriptionLocation = 'syn26067631/wiki/621692',
                       studyDescription = 'The MindKind study was commissioned by the Mental Health Priority Area at Wellcome Trust to understand the data governance and engagement strategies influencing young peoples’ (aged 16-24) participation in app-based studies of mental health. The study hypothesized that willingness to participate in research is influenced by input into how their data is collected, shared, and used. It employed mixed methods to understand the feasibility of global, smartphone-based studies of youth mental health.',
                       dataAccessInstructions = 'syn26067631/wiki/621690'),
  
  ## MESA
  'syn53711082' = list(consortium = 'mHealth',
                      collectionType = 'Observational Study',
                      study = 'Multi-Ethnic Study of Atherosclerosis (MESA) Sleep Study',
                      numberParticipants= as.integer(2237), 
                      dataCollectionMethod= c('passive', 'patient reported outcome',
                                              'clinical assessment'),
                      deviceType = c('wearable'),
                      sensorType = c('accelerometer', 'photosensor',
                                     'polysomnography'),
                      devicePlatform = c('Philips Respironics', 
                                      'Compumedics Ltd.'),
                      deviceLocation = c('wrist', 'various'),
                      diagnosis=  c('control'),
                      reportedOutcome = c('sleep report'),
                      digitalAssessmentCategory= c('sleep'),
                      digitalAssessmentDetails = c('sleep scoring', 'heart rate variability'),
                      sensorDataType = c('raw', 'processed'),
                      investigator= c('The MESA Consortium', "NHLBI"),
                      resourceType = 'curatedData',
                      # intervention = '',
                      keywords = c('sleep', 'cardiovascular disease'),
                      dhPortalIndex = 'TRUE', # Change after filling annotations
                      studyDescriptionLocation = 'syn53711082',
                      studyDataDescriptionLocation = 'syn53711082/wiki/626337',
                      studyDescription = 'The objectives of the MESA Sleep Study are to understand how variations in sleep and sleep disorders vary across gender and ethnic groups and relate to measures of subclinical atherosclerosis. Sleep Exam (MESA Sleep) which included full overnight unattended polysomnography, 7-day wrist-worn actigraphy, and a sleep questionnaire.',
                      dataAccessInstructions = 'syn53711082/wiki/626338')
  
  
  )

##############
# Update Annotations in Synapse
##############  
# Update annotations
projects.list <- names(projects.annotations) 
for(proj.id in projects.list){
  
  #### Uncomment this before updating for real
# synSetAnnotations(proj.id, annotations = projects.annotations[[proj.id]])
  proj<-synGet(proj.id)
  proj$annotations<-projects.annotations[[proj.id]]
  proj<-synStore(proj)
  ####
  
  print(proj.id)
  print(projects.annotations[[proj.id]])
}

