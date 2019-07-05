# Halfpipe Update

This repo builds a docker image which is designed to be used in a concourse task to self-update a pipeline.

See <https://docs.halfpipe.io> for more info on using it.


### How it works

1. Update fly.

2. Update halfpipe.

3. Login to concourse.

4. Check pipeline already exists. Obviously it should as it is running inside the pipeline - something is wrong otherwise.

5. Pause the pipeline. We might be about to change the pipeline, so stop new builds triggering until we're finished.

6. Run `halfpipe upload` to update the pipeline based on the `.halfpipe.io` file in the git repo.

7. If we just changed the pipeline, disable all older versions. This prevents any new jobs triggering immediately with a previous version.

8. Unpause the pipeline.
