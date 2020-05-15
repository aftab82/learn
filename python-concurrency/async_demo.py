import asyncio


async def speak_async():
    print('this is async')


loop = asyncio.get_event_loop()
loop.run_until_complete(speak_async())
loop.close()
