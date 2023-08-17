package main

import (
	"context"
	"log"

	"github.com/hashicorp/terraform-exec/tfexec"
)

func main() {

	// This is the path to the terraform binary and the working directory where the terraform files are located
	execPath := "/opt/homebrew/bin/terraform"
	workingDir := "./terraform"
	tf, err := tfexec.NewTerraform(workingDir, execPath)
	if err != nil {
		log.Fatalf("error running NewTerraform: %s", err)
	}

	// Running Terraform Init
	err = tf.Init(context.Background(), tfexec.Upgrade(true))
	if err != nil {
		log.Fatalf("error running Init: %s", err)
	}

	// Running Terraform Plan
	// outPath := tfexec.Out("./terraform.tfstate")
	// tfPlan, err := tf.Plan(context.Background(), outPath)
	// if err != nil {
	// 	log.Fatalf("error running Plan: %s", err)
	// }
	// fmt.Println(tfPlan)

	// Running Terraform Apply
	err = tf.Apply(context.Background(), tfexec.StateOut("./terraform.tfstate"))
	if err != nil {
		log.Fatalf("error running Apply: %s", err)
	}

}
