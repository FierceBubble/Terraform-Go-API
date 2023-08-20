package main

import (
	"context"
	"fmt"
	"log"
	"net/http"

	"github.com/hashicorp/terraform-exec/tfexec"
	"github.com/labstack/echo/v4"
)

func main() {
	/* - - - - - HTTP Server - - - - - */
	// http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
	// 	fmt.Fprintf(w, "Hello World")
	// })

	// log.Fatal(http.ListenAndServe(":7890", nil))

	// - - - - - Echo - - - - - //
	// Echo instance
	// e := echo.New()

	// Middleware
	// e.Use(middleware.Logger())
	// e.Use(middleware.Recover())

	// Routes
	// e.GET("/", hello)

	// Start server
	// e.Logger.Fatal(e.Start(":1323"))

	// - - - - - Terraform - - - - - //
	var execPath string = "/opt/homebrew/bin/terraform"
	var workingDir string = "./terraform/modules/upcloud"
	/* - - - - - Terraform - - - - -
	This is the path to the terraform binary and the working
	directory where the terraform files are located */
	tf, err := tfexec.NewTerraform(workingDir, execPath)
	if err != nil {
		log.Fatalf("error running NewTerraform: %s", err)
	}

	// Running Terraform Init
	err = tf.Init(context.Background(), tfexec.Upgrade(true))
	if err != nil {
		log.Fatalf("error running Init: %s", err)
	}

	for {
		var cmd string

		fmt.Println("Enter a Terraform command: ")
		fmt.Scan(&cmd)

		if cmd == "q" || cmd == "quit" {
			fmt.Println("Exiting...")
			break
		}

		if cmd == "apply" {

			// - - - - - Running Terraform Apply - - - - - //
			tfState := tfexec.StateOut("./terraform.tfstate")
			err = tf.Apply(context.Background(), tfState)
			if err != nil {
				log.Fatalf("error running Apply: %s", err)
			}

			fmt.Println(tfState)
			fmt.Println("Terraform Apply Complete")
		}

		// if cmd == "plan" {
		// 	// Running Terraform Plan
		// 	outPath := tfexec.StateOut("./terraform.tfstate")
		// 	tfPlan, err := tf.Plan(context.Background(), outPath)
		// 	if err != nil {
		// 		log.Fatalf("error running Plan: %s", err)
		// 	}
		// 	fmt.Println(tfPlan)
		// }

		if cmd == "destroy" {
			// - - - - - Running Terraform Destroy - - - - - //
			err = tf.Destroy(context.Background())
			if err != nil {
				log.Fatalf("error running Destroy: %s", err)
			}
			fmt.Println()
			fmt.Println("Terraform Destroy Complete")
		}

	}
}

// Handler
func hello(c echo.Context) error {
	return c.String(http.StatusOK, "Hello, World!")
}
