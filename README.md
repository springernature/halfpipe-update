# Halfpipe Update

[![build status](http://badger.halfpipe.io/engineering-enablement/halfpipe-update-docker)](https://concourse.halfpipe.io/teams/engineering-enablement/pipelines/halfpipe-update-docker)

This repo builds a docker image which is designed to be used in CI to keep the configuration in sync with the halfpipe manifest.

There are scripts for Concourse (`update-pipeline`) and GitHub Actions (`update-actions-workflow`).

See <https://ee.public.springernature.app/rel-eng/halfpipe/features/> for more info on using it.


## Concourse 
1. Update fly.

2. Update halfpipe.

3. Login to concourse.

4. Check team in halfpipe file matches current team

5. Check if pipeline already exists. Obviously it should as it is running inside the pipeline - something is wrong otherwise, so exit (error).

6. Run `halfpipe` to generate Concourse pipeline

7. Check if pipeline has changed. Exit (success) if there are no changes.

If the pipeline has changed:

8. Check if any new jobs have been added. If so, disable all existing versions. This prevents the new jobs triggering immediately with the previous version.

9. Update the pipeline.


## GitHub Actions
1. Update halfpipe

2. Run `halfpipe` to generate workflow

3. Set GitHub Actions output variable `synced=true|false`. Halfpipe then uses this variable to either commit the changes or continue running the workflow.
