import React, { useState } from 'react'
import '@instructure/canvas-theme'

import { Alert } from '@instructure/ui-alerts'
import { Button } from '@instructure/ui-buttons'
import { CodeEditor } from '@instructure/ui-code-editor'
import { Grid } from '@instructure/ui-layout'
import { Heading } from '@instructure/ui-elements'
import { Link } from '@instructure/ui-elements'
import { submitForm } from '../shared/RequestUtils'
import { TextInput } from '@instructure/ui-text-input'
import { View } from '@instructure/ui-layout'

const CreateForm = props => {
  const [iss, setISS] = useState("");
  const [authorizationUri, setAuthorizationUri] = useState("")
  const [publicKeyUri, setPublicKeyUri] = useState("")
  const [errorMessage, setErrorMessage] = useState("")
  const [newPlatform, setNewPlatform] = useState("")
  const [newPlatformRaw, setNewPlatformRaw] = useState({})

  const success = (response) => {
    setNewPlatform(JSON.stringify(response.data, null, 2))
    setNewPlatformRaw(response.data)
  }
  const error = (errorResponse) => { setErrorMessage(errorResponse.message) }
  const data = () => {
    return {
      platform: {
        iss: iss,
        authorization_uri: authorizationUri,
        public_key_uri: publicKeyUri
      }
    }
  }
  const submit = () => {
    setErrorMessage("")
    submitForm(data(), props.formAction, success, error)
  }

  return(
    <Grid hAlign="space-around">
      {
        errorMessage && <Grid.Row>
          <Grid.Col width={8}>
            <Alert
              variant="error"
              closeButtonLabel="Close"
              margin="none"
            >
              {errorMessage}
            </Alert>
          </Grid.Col>
        </Grid.Row>
      }
      {
        !newPlatform && <Grid.Row>
          <Grid.Col width={8}>
            <Heading margin="x-large 0 0">Create Platform</Heading>
            <form>
              <View display="block" margin="medium 0 0">
                <TextInput
                  value={iss}
                  label="Platform ISS"
                  layout="stacked"
                  name="iss"
                  onChange={(e) => {setISS(e.currentTarget.value)}}
                />
              </View>
              <View display="block" margin="medium 0 0">
                <TextInput
                  value={authorizationUri}
                  label="Authorization URI"
                  layout="stacked"
                  name="authorization_uri"
                  onChange={(e) => {setAuthorizationUri(e.currentTarget.value)}}
                />
              </View>
              <View display="block" margin="medium 0 0">
                <TextInput
                  value={publicKeyUri}
                  label="Public Key URI"
                  layout="stacked"
                  name="public_key_uri"
                  onChange={(e) => {setPublicKeyUri(e.currentTarget.value)}}
                />
              </View>
              <View display="block" margin="medium 0 0">
                <Button variant="primary"
                  margin="0 x-small 0 0"
                  onClick={submit}
                >
                  Create Platform
                </Button>
              </View>
            </form>
          </Grid.Col>
        </Grid.Row>
      }
      {
        newPlatform && <Grid.Row>
          <Grid.Col width={8}>
            <Heading margin="x-large 0 medium 0">New Platform</Heading>
            <CodeEditor
              label='Platform'
              defaultValue={newPlatform}
              language='javascript'
              options={{ lineNumbers: false }}
            />
            <View display="block" margin="medium 0 0">
              Create a <Link
                href={`${props.credentialUrl}?platform_id=${newPlatformRaw.id}&platform_iss=${newPlatformRaw.iss}`}
              >new client credential</Link>
            </View>
          </Grid.Col>
        </Grid.Row>
      }
    </Grid>
  )
}

export default CreateForm
