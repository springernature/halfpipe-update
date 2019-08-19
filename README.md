# Halfpipe Update

[![build status](http://badger.halfpipe.io/engineering-enablement/halfpipe-update-docker)](https://concourse.halfpipe.io/teams/engineering-enablement/pipelines/halfpipe-update-docker)

This repo builds a docker image which is designed to be used in a concourse task to self-update a pipeline. It ensures the pipeline configuration in Concourse matches the halfpipe file in the current git revision.

See <https://docs.halfpipe.io/auto-updating-pipelines/> for more info on using it.


### How it works

1. Update fly.

2. Update halfpipe.

3. Login to concourse.

4. Check if pipeline already exists. Obviously it should as it is running inside the pipeline - something is wrong otherwise, so exit (error).

5. Run `halfpipe` to generate Concourse pipeline

6. Check if pipeline has changed. Exit (success) if there are no changes.

If the pipeline has changed:

7. Check if any new jobs have been added. If so, disable all existing versions. This prevents the new jobs triggering immediately with the previous version.

8. Update the pipeline.
