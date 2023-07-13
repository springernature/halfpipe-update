# Halfpipe Update

[![build status](http://badger.halfpipe.io/engineering-enablement/halfpipe-update-docker)](https://concourse.halfpipe.io/teams/engineering-enablement/pipelines/halfpipe-update-docker)

This repo builds a docker image which is designed to be used in a concourse task to self-update a pipeline. It ensures the pipeline configuration in Concourse matches the halfpipe file in the current git revision.

See <https://docs.halfpipe.io/auto-updating-pipelines/> for more info on using it.


### How it works

1. Update fly.

2. Update halfpipe.

3. Login to concourse.

4. Check team in halfpipe file matches current team

5. Check if pipeline already exists. Obviously it should as it is running inside the pipeline - something is wrong otherwise, so exit (error).

6. Run `halfpipe` to generate Concourse pipeline

7. Check if pipeline has changed. Exit (success) if there are no changes.

If the pipeline has changed:

8. Check if any new jobs have been added. If so, disable all existing versions. This prevents the new jobs triggering immediately with the previous version.

9. Check the version file in GCS. It should match the version resource's latest version number. If it is missing or 0.0.0 it could be because the pipeline has been renamed.

10. Update the pipeline.
