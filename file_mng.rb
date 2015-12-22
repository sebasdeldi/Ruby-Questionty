class File_mng

	def initialize
		@file = File.new("questionary.out", "a")
		@preguntas = []
		@respuestas = []
	end

	def preguntas
		@preguntas
	end

	def respuestas
		@respuestas
	end

	def start
		puts
		puts "* INGRESA 'A' Ó 'a' PARA COMENZAR A AGREGAR PREGUNTAS Y RESPUESTAS EN EL ARCHIVO DEL JUEGO!"
		puts
		puts "* INGRESA 'N Ó 'n' PARA COMENZAR A JUGAR!"
		puts
		activate = gets.chomp

		if activate == "a"|| activate == "A"
			append_to_file
		end

		if activate == "N"|| activate == "n"
			play
		end
	end

	def append_to_file
		
		puts
		puts "INGRESA LA PREGUNTA QUE QUIERES GUARDAR EN EL ARCHIVO"
		puts
		append_question = gets
		@file << append_question

		puts
		puts "INGRESA SU RESPUESTA"
		puts
		append_answer = gets
		@file << append_answer

		@file.close
		puts
		puts "DATOS AGREGADOS, LA PREGUNTA APARECERÁ EN LA SIGUIENTE RONDA DE EL JUEGO"
	end

	def play
		arrange_arrays
		puts


		puts "PREGUNTAS = #{@preguntas}"
		puts
		puts "RESPUESTAS = #{@respuestas}"
		puts

			
		@preguntas.each_with_index do |pregunta, i|

			puts pregunta
			puts
			puts "INGRESA TU RESPUESTA"
			puts
			respuesta = gets.chomp

			until respuesta == @respuestas[i]
				puts
				puts "INCORRECTO ! VUELVE A INTENTARLO"
				puts
				puts @preguntas[i-1]
				break
			end
				
			if respuesta == @respuestas[i]
				puts
				puts "CORRECTO !"
				puts
			end
		end
		puts
		puts "SE ACABARON LAS PREGUNTAS, FELICITACIONES!"
	end

	def arrange_arrays
		#TODO LO QUE ESTÉ EN LÍNEAS IMPARES VAN A SER PREGUNTAS
		#TODO LO QUE ESTÉ EN LÍNEAS PARES SON RESPUESTAS
		i = 0

		File.open("questionary.out").each_line do |line|
			i = i+1
			
			if i % 2 == 0
				@respuestas << line.to_s.downcase.chomp
			else 
				@preguntas << line.to_s.downcase.chomp
			end
		end
	end

end

file_mng = File_mng.new
file_mng.start



