import redis

REDIS_PORT = 6379
REDIS_HOST = 'localhost'

client = redis.Redis(host=REDIS_HOST, port=REDIS_PORT, db=0)
nomb= 'nombre'
estad= 'estadio'
entre = 'entrenador'
anio = 'anioFundacion'
presi = 'presidente'
a = True
while a:
    
    op = input('seleccione una operacion - agregar / mostrar / salir: ')
    
    if op == 'agregar':
        nombre = input('Ingrese el nombre del equipo: ')
        estadio = input('Ingrese el estadio del equipo: ')
        entrenador = input('Ingrese el entrenador del equipo: ')
        presidente = input('Ingrese el presidente del equipo: ')
        anioFundacion = input('Ingrese el año de fundacion del equipo: ')
        client.set(nomb, nombre)
        client.set(estad, estadio)
        client.set(entre, entrenador)
        client.set(presi,presidente)
        client.set(anio, anioFundacion)
    elif op == 'mostrar':
        print("Nombre: {} / Estadio: {} / Entrenador: {} / Presidente: {} / Año de fundacion: {}".format(client.get(nomb).decode('utf-8'), client.get(estad).decode('utf-8'), client.get(entre).decode('utf-8'), client.get(presi).decode('utf-8'), client.get(anio).decode('utf-8')))

    elif op == 'salir':
        a = False