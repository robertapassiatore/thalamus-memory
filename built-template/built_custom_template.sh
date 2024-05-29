#!/usr/bin/bash
#### Roberta 31.8.2023 ######

#specify where ANTS is installed
export ANTSPATH=/YourPath/ANTs/bin
export PATH=${ANTSPATH}:$PATH


ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=40
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS


### specify list of subjects for building customized template

subjectList=("SBJ1" "SBJ2" "SBJ3" ... "SBJn")     

### specify folder names
experimentDir=/YourFolder  #folder containing results

normtempOutDir=$experimentDir         #where the norm temp should be stored at

workingDir=$normtempOutDir/temp #temporary dir that might be deleted later

#pediatric_t=$experimentDir/PathToYourReference.nii ## reference template, eg. MNI

#specify parameters for buildtemplateparallel.sh
#compulsory arguments

ImageDimension=3
OutPrefix='Template_uniba_' ## change with the site name

#optional arguments
ParallelMode=2
GradientStep='0.05'
IterationLimit=8
Cores=40
MaxIteration=30x90x20
N3Correct=1
Rigid=1
MetricType='PR'
TransformationType='GR'

#go into the folder where the script should be run
cd $workingDir

#assemble the command for the script from the input parameters defined above
cmd="bash $ANTSPATH/buildtemplateparallel.sh -d $ImageDimension -o $OutPrefix  -c $ParallelMode \
     -g $GradientStep -i $IterationLimit -j $Cores  -n $N3Correct  \
     -r $Rigid -s $MetricType -t $TransformationType *_T1.nii "

echo $cmd #state the command
eval $cmd #execute the command
