// !+++ Host Application +++

func hostHTTPGet(urlPos, urlSize uint32) uint32 {


  // you must implement ReadFromMemory
  buffer := ReadFromMemory(urlPos, urlSize)

  url := string(buffer)

  httpClient := resty.New()
  resp, err := httpClient.R().EnableTrace().Get(url)
  
  // you must implement CopyToMemory
  bodyPos, bodySize := CopyToMemory(string(resp.Body))

  // you must implement PackIntoOneValue
  return PackIntoOneValue(bodyPos, bodySize)

}
