#!/usr/bin/env groovy

node {
	stage('checkout') {
		checkout scm
	}
	stage('Clean') {
		withMaven(maven: 'maven') {
			sh "mvn clean"
		}
	}
	stage('backend tests') {
		withMaven(maven: 'maven') {
			 sh "mvn test"
		}
	}

	stage('Package') {
		withMaven(maven: 'maven') {
			sh "mvn package"
		}
	}

	stage('Build Docker Image') {
		withMaven(maven: 'maven') {
			sh "mvn jib:build"
		}
	}

}
