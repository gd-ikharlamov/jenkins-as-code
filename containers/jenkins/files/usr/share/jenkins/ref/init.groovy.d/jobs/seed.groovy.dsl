#!groovy

folder('metabase') {
    description('Folder for metabase jobs')
}


pipelineJob('metabase/build') {

    def repo = 'git@github.com:griddynamics/tools-dashboards.git'

    description('metabase build job')

    parameters {
        stringParam('metabase_version', '0.28.1', '')
    }

    definition {
        cpsScm {
            scm {
                git {
                    remote { url(repo)
                             credentials('7d5c0fcc-8585-46a4-a970-a82bdb57f31f')
                           }
                    branches('master')
                    scriptPath('jobs/metabase-build-pipeline')
                    extensions { }
                }
            }
        }
    }
}
