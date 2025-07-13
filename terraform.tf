terraform { 
  cloud { 
    
    organization = "abjcloud" 

    workspaces { 
      name = "s3Website" 
    } 
  } 
}