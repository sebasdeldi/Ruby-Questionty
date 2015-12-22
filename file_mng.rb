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
		puntaje = 0
		arrange_arrays
		puts

=begin
		puts "PREGUNTAS = #{@preguntas}"
		puts
		puts "RESPUESTAS = #{@respuestas}"
		puts
=end
			
		@preguntas.each_with_index do |pregunta, i|

			puts pregunta
			puts
			puts "INGRESA TU RESPUESTA"
			puts
			respuesta = gets.chomp
			puts

			until respuesta == @respuestas[i]

				puntaje = puntaje - 2
				puts "INCORRECTO ! VUELVE A INTENTARLO"
				puts
				puts
				puts
				puts pregunta
				puts
				puts "INGRESA TU RESPUESTA"
				puts
				respuesta = gets.chomp
				puts

			end
				
			if respuesta == @respuestas[i]
				puntaje = puntaje + 1
				puts "CORRECTO !"
				puts
				puts
				puts
			end
		end
		if puntaje > 0
			puts "TU PUNTAJE ES: #{puntaje}, TU BALANCE ES POSITIVO, CONTINUA ASÍ !"
		else
			puts "TU PUNTAJE ES: #{puntaje}, TU BALANCE ES NEGATIVO, ESFUERZATE MÁS !"
		end
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



