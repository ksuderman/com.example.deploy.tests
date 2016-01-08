package com.example.deploy.tests;

/**
 * This is the main class for the test project.  This class does
 * many important things like print "Hello world."
 *
 * @author Keith Suderman
 */
public class Main
{
	/** Default constructor does nothing. */
	public Main()
	{

	}

	/** The run method does the actual work. */
	public void run() {
		System.out.println("Hello world");
	}

	/** Application entry point. */
	public static void main(String[] args) {
		new Main().run();
	}
}
