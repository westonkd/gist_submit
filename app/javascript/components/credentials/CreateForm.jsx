import React, { useState } from 'react'
import '@instructure/canvas-theme'

import { Alert } from '@instructure/ui-alerts'
import { Button } from '@instructure/ui-buttons'
import { Grid } from '@instructure/ui-layout'
import { Heading } from '@instructure/ui-elements'
import { submitForm } from '../shared/RequestUtils'
import { TextArea } from '@instructure/ui-forms'
import { TextInput } from '@instructure/ui-text-input'
import { View } from '@instructure/ui-layout'

const CreateForm = props => {
  const [errorMessage, setErrorMessage] = useState("")
  const [clientId, setClientId] = useState("")

  const success = (response) => {setNewPlatform(JSON.stringify(response.data, null, 2))}
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

  console.log(props)

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
      <Grid.Row>
        <Grid.Col width={8}>
          <Heading margin="x-large 0 0">{`Create Client Credential for ${props.platformISS}`}</Heading>
          <form>
            <View display="block" margin="medium 0 0 0">
              <TextInput
                value={props.configurationUrl}
                label="Tool Configuration URL"
                layout="stacked"
                disabled
              />
            </View>
            <View display="block" margin="medium 0 0 0">
              <TextInput
                value={clientId}
                label="Client ID"
                layout="stacked"
                name="client_id"
                onChange={(e) => {setISS(e.currentTarget.value)}}
              />
            </View>
            <View display="block" margin="medium 0 0 0">
              <TextArea
                label="Public JWK"
              />
            </View>
            <View display="block" margin="x-small 0 0 0">
              <Button variant="primary"
                margin="0 x-small 0 0"
                onClick={submit}
              >
                Create Credential
              </Button>
            </View>
          </form>
        </Grid.Col>
      </Grid.Row>
    </Grid>
  )
}

export default CreateForm
