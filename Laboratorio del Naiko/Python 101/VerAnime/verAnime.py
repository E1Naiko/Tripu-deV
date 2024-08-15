"""
EL PROGRAMA PA VER SERIES DE ANIME: link https://www.youtube.com/shorts/7uZL7idkqJ0
"""
from animeflv import AnimeFLV
with AnimeFLV() as api:
    elements = api.search(input("Escribe el anime:"))
    for i, element in enumerate(elements):
        print(f"{i}, {element.title}")
    try:
        selection = int(input("Seleccione una opción: "))
        info = api.get_anime_info(elements[selection].id) # type: ignore
        info.episodes.reverse() # type: ignore
        for j, episode in enumerate(info.episodes):  # type: ignore
            print(f"{j} | Episode - {episode.id}")
        index_episode = int(input("Seleccione episodio:"))
        serie = elements[selection].id
        capitulo = info.episodes[index_episode].id # type: ignore
        results = api.get_links(serie, capitulo) # type: ignore
        for result in results:
            print(f"{result.server} - {result.url}")
    except Exception as e:
        print(e)