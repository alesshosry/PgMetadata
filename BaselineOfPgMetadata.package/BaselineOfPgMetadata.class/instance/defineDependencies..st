baselines
defineDependencies: spec

	^ spec
		  "baseline: 'Garage' with: [ 
			  spec
				  repository: 'github://juliendelplanque/garage:master';
				  loads: #( 'postgresV2' ) ];"
		  baseline: 'P3'
		  with: [ spec repository: 'github://alesshosry/P3:master' ];
		  yourself